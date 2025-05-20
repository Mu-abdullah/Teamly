import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'get_image_state.dart';

class GetImageCubit extends Cubit<GetImageState> {
  GetImageCubit() : super(ImageUploadInitial());

  static GetImageCubit get(context) => BlocProvider.of(context);

  List<File?> get images {
    if (state is ImageGetSuccess) {
      return List.from((state as ImageGetSuccess).images);
    }
    return [];
  }

  Future<void> pickImages() async {
    emit(ImageGetLoading());
    try {
      List<XFile> pickedFiles = await ImagePicker().pickMultiImage();
      List<File?> newImages =
          pickedFiles.map((xFile) => File(xFile.path)).toList();
      if (state is ImageGetSuccess) {
        List<File?> currentImages = List.from(
          (state as ImageGetSuccess).images,
        );
        int remaining = 20 - currentImages.length;
        if (remaining > 0) {
          currentImages.addAll(newImages.take(remaining));
        }
        emit(ImageGetSuccess(currentImages));
      } else {
        emit(ImageGetSuccess(newImages.take(8).toList()));
      }
    } catch (e) {
      emit(ImageGetFailure(e.toString()));
    }
  }

  void removeImage(int index) {
    if (state is ImageGetSuccess) {
      final images = List<File?>.from((state as ImageGetSuccess).images);
      images.removeAt(index);
      emit(ImageGetSuccess(images));
    }
  }

  Future<void> getImageFromCamera() async {
    emit(ImageGetLoading());
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        File newImage = File(pickedFile.path);
        if (state is ImageGetSuccess) {
          List<File?> currentImages = List.from(
            (state as ImageGetSuccess).images,
          );
          if (currentImages.length < 20) {
            currentImages.add(newImage);
            emit(ImageGetSuccess(currentImages));
          }
        } else {
          emit(ImageGetSuccess([newImage]));
        }
      }
    } catch (e) {
      emit(ImageGetFailure(e.toString()));
    }
  }
}
