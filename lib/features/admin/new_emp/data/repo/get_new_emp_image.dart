import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/services/supabase/backend_points.dart';

class GetNewEmpImage {
  final SupabaseClient supabase = Supabase.instance.client;
  Future<File?> getImageFromGallery({required picker}) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        throw Exception('No image selected');
      }
    } catch (e) {
      throw Exception('Failed to fetch image: $e');
    }
  }

  Future<Uint8List?> getImageFromPC({required ImagePicker picker}) async {
    try {
      // Pick image from the camera
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        // Return the image bytes if the file is selected
        return await pickedFile.readAsBytes();
      } else {
        throw Exception('No image selected');
      }
    } catch (e) {
      throw Exception('Failed to fetch image: $e');
    }
  }

  Future<String?> uploadImageFromPC({
    required String department,
    required Uint8List imageBytes,
  }) async {
    try {
      final path =
          'worktopia/$department/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final file = imageBytes; // The image bytes directly

      await supabase.storage.from('images').uploadBinary(path, file);

      final urlResponse = supabase.storage.from('images').getPublicUrl(path);

      return urlResponse; // Return the public URL of the image
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  Future<String?> uploadPhotoFromAndroid({
    required File? image,
    required String store,
    required String category,
  }) async {
    try {
      if (image == null) {
        return null;
      }

      final file = File(image.path);
      final path =
          'nabta/$store/$category/${DateTime.now().millisecondsSinceEpoch}.jpg';

      await supabase.storage.from(BackendPoint.imageBucket).upload(path, file);
      final urlResponse = supabase.storage
          .from(BackendPoint.imageBucket)
          .getPublicUrl(path);

      return urlResponse;
    } catch (e) {
      debugPrint('Error uploading photo: $e');
      return null;
    }
  }
}
