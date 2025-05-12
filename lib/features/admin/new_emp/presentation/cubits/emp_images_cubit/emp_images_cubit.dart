import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../core/services/supabase/backend_points.dart';
import 'emp_images_state.dart';

class ImageToPdfCubit extends Cubit<ImageToPdfState> {
  final ImagePicker _picker = ImagePicker();

  ImageToPdfCubit() : super(ImageToPdfState());

  // Pick multiple images
  Future<void> pickImages() async {
    try {
      final List<XFile> selectedImages = await _picker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        emit(state.copyWith(images: selectedImages, message: null));
      } else {
        emit(state.copyWith(message: 'No images selected!'));
      }
    } catch (e) {
      emit(state.copyWith(message: 'Error picking images: $e'));
    }
  }

  // Convert images to PDF and upload to Supabase
  Future<void> convertAndUpload() async {
    if (state.images.isEmpty) {
      emit(state.copyWith(message: 'No images selected!'));
      return;
    }

    emit(state.copyWith(isLoading: true, message: null));

    try {
      // Create a PDF document
      final pdf = pw.Document();

      for (var image in state.images) {
        final imageFile = File(image.path);
        final imageBytes = await imageFile.readAsBytes();
        final pdfImage = pw.MemoryImage(imageBytes);

        pdf.addPage(
          pw.Page(
            build: (pw.Context context) => pw.Center(child: pw.Image(pdfImage)),
          ),
        );
      }

      // Save the PDF to a temporary file
      final tempDir = await getTemporaryDirectory();
      final pdfFile = File('${tempDir.path}/output.pdf');
      await pdfFile.writeAsBytes(await pdf.save());

      // Upload the PDF to Supabase
      final supabase = Supabase.instance.client;
      final fileName = 'pdfs/${DateTime.now().millisecondsSinceEpoch}.pdf';
      await supabase.storage
          .from(BackendPoint.imageBucket)
          .uploadBinary(
            fileName,
            await pdfFile.readAsBytes(),
            fileOptions: const FileOptions(contentType: 'application/pdf'),
          );

      emit(
        state.copyWith(isLoading: false, message: 'PDF uploaded successfully!'),
      );
    } catch (e) {
      print("Error uploading PDF: $e");
      emit(state.copyWith(isLoading: false, message: 'Error: $e'));
    }
  }
}
