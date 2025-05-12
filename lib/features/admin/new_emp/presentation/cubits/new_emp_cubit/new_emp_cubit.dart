import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../auth/data/models/emp_model.dart';
import '../../../data/repo/convert_images_to_pdf.dart';
import '../../../data/repo/get_new_emp_image.dart';
import '../../../data/repo/upload_emp_info_to_supabase.dart';

part 'new_emp_state.dart';

class NewEmpCubit extends Cubit<NewEmpState> {
  UploadEmpInfoToSupabase uploadEmpInfoToSupabase;
  GetNewEmpImage getImage = GetNewEmpImage();
  ConvertImagesToPdf convertImagesToPdf = ConvertImagesToPdf();
  NewEmpCubit(this.uploadEmpInfoToSupabase) : super(NewEmpInitial());

  static NewEmpCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();
  var nid = TextEditingController();
  var startIn = TextEditingController();
  var salary = TextEditingController();

  String? positionId;
  String? gender;

  File? image;
  final ImagePicker picker = ImagePicker();
  String? imagePath;
  String? imageUrl;
  Uint8List? pickedBytes;

  void whichPaltform() {
    if (kIsWeb == true) {
      getImageFromPC();
    } else {
      getImagefromGallery();
    }
  }

  Future<void> getImagefromGallery() async {
    try {
      image = await getImage.getImageFromGallery(picker: picker);
      emit(GetImageFromGallery());
    } catch (e) {
      emit(ErrorImageFromGallery(error: e.toString()));
      debugPrint('Error getting image from gallery: $e');
    }
  }

  Future<void> getImageFromPC() async {
    try {
      pickedBytes = await getImage.getImageFromPC(picker: picker);
      emit(GetImageFromGallery()); // Image picked successfully
    } catch (e) {
      emit(ErrorImageFromGallery(error: e.toString())); // Handle errors
    }
  }

  Future<void> uploadEmpData({required EmpModel emp}) async {
    emit(NewEmpLoading());
    var result = await uploadEmpInfoToSupabase.uploadEmpInfoToSupabase(
      emp.toJson(),
    );
    result.fold(
      (l) {
        if (!isClosed) {
          emit(NewEmpError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(NewEmpSubmitted(emp: r));
        }
      },
    );
  }

  Future<String> convertAndUpload({
    required List<File> images,
    required String companyID,
  }) async {
    emit(NewEmpLoading());
    var pdfUrl = await uploadEmpInfoToSupabase.convertImageToPDFAndUpload(
      images: images,
      companyID: companyID,
      nid: nid.text,
    );
    debugPrint(pdfUrl);
    return pdfUrl;
  }

  Future<String> uploadImage({
    required File image,
    required String companyID,
  }) async {
    emit(NewEmpLoading());
    var imageUrl = await uploadEmpInfoToSupabase.uploadImage(
      image: image,
      companyID: companyID,
      nid: nid.text,
    );
    debugPrint(imageUrl);
    return imageUrl;
  }
}
