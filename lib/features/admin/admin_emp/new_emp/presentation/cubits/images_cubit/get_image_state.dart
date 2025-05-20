part of 'get_image_cubit.dart';

abstract class GetImageState {}

class ImageUploadInitial extends GetImageState {}

class ImageGetLoading extends GetImageState {}

class ImageGetProgress extends GetImageState {
  final List<String> uploadedUrls;
  final int totalImages;
  ImageGetProgress(this.uploadedUrls, this.totalImages);
}

class ImageGetSuccess extends GetImageState {
  final List<File?> images;
  ImageGetSuccess(this.images);
}

class ImageGetFailure extends GetImageState {
  final String error;
  ImageGetFailure(this.error);
}


