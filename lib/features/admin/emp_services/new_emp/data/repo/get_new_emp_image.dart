import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../core/services/supabase/backend_points.dart';

class GetNewEmpImage {
  final SupabaseClient supabase = Supabase.instance.client;

  // Pick image from gallery (mobile)
  Future<File?> getImageFromGallery({required ImagePicker picker}) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) return File(pickedFile.path);
      return null; // Return null if no image selected
    } catch (e) {
      throw Exception('Failed to fetch image: $e');
    }
  }

  // Pick image from camera (web)
  Future<Uint8List?> getImageFromPC({required ImagePicker picker}) async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) return await pickedFile.readAsBytes();
      return null;
    } catch (e) {
      throw Exception('Failed to fetch image: $e');
    }
  }

  // Upload image/PDF from web (Uint8List)
  Future<String?> uploadImageFromPC({
    required String comapnyId,
    required Uint8List imageBytes,
    required String fileExtension,
  }) async {
    try {
      final path =
          '$comapnyId/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
      await supabase.storage
          .from(BackendPoint.imageBucket)
          .uploadBinary(path, imageBytes);
      return supabase.storage.from(BackendPoint.imageBucket).getPublicUrl(path);
    } catch (e) {
      throw Exception('Failed to upload: $e');
    }
  }

  // Upload image/PDF from mobile (File)
  Future<String?> uploadPhotoFromAndroid({
    required File? image,
    required String comapnyId,
    required String fileExtension,
  }) async {
    try {
      if (image == null) return null;
      final path =
          '$comapnyId/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
      await supabase.storage.from(BackendPoint.imageBucket).upload(path, image);
      return supabase.storage.from(BackendPoint.imageBucket).getPublicUrl(path);
    } catch (e) {
      debugPrint('Error uploading: $e');
      return null;
    }
  }
}
