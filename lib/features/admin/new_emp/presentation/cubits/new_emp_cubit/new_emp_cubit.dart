import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repo/get_new_emp_image.dart';

part 'new_emp_state.dart';

class NewEmpCubit extends Cubit<NewEmpState> {
  GetNewEmpImage getImage = GetNewEmpImage();
  NewEmpCubit() : super(NewEmpInitial());

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
}
