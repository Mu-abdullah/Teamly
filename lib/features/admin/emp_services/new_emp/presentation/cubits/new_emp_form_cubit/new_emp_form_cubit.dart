import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import '../../../data/repo/convert_images_to_pdf.dart';
import '../../../data/repo/get_new_emp_image.dart';
import '../../../data/repo/upload_emp_info_to_supabase.dart';

part 'new_emp_form_state.dart';

class NewEmpFormCubit extends Cubit<NewEmpFormState> {
  UploadEmpInfoToSupabase uploadEmpInfoToSupabase;
  GetNewEmpImage getImage = GetNewEmpImage();
  ConvertImagesToPdf convertImagesToPdf = ConvertImagesToPdf();
  NewEmpFormCubit(this.uploadEmpInfoToSupabase) : super(NewEmpInitial());

  static NewEmpFormCubit get(context) => BlocProvider.of(context);

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

  Future<String> convertAndUpload({
    required List<File> images,
    required String companyID,
  }) async {
    emit(NewEmpLoading());

    try {
      final pdfUrl = await uploadEmpInfoToSupabase.convertImageToPDFAndUpload(
        images: images,
        companyID: companyID.toString(),
        nid: nid.text.toString(),
      );

      return pdfUrl;
    } catch (e) {
      if (!isClosed) {
        emit(NewEmpError(LangKeys.error));
      }
      rethrow; // Rethrow to let SubmitedEmp handle the error
    }
  }

  Future<String> uploadImage({
    required File image,
    required String companyID,
  }) async {
    emit(NewEmpLoading());

    try {
      final imageUrl = await uploadEmpInfoToSupabase.uploadImage(
        image: image,
        companyID: companyID.toString(),
        nid: nid.text.toString(),
      );

      return imageUrl;
    } catch (e) {
      if (!isClosed) {
        emit(NewEmpError(LangKeys.error));
      }
      rethrow;
    }
  }
}
