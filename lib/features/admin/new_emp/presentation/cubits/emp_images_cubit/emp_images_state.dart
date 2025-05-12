import 'package:image_picker/image_picker.dart';

class ImageToPdfState {
  final List<XFile> images;
  final bool isLoading;
  final String? message;

  ImageToPdfState({
    this.images = const [],
    this.isLoading = false,
    this.message,
  });

  ImageToPdfState copyWith({
    List<XFile>? images,
    bool? isLoading,
    String? message,
  }) {
    return ImageToPdfState(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}