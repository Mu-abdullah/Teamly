import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/services/supabase/data_base_services.dart';
import '../../../../auth/data/models/emp_model.dart';
import 'convert_images_to_pdf.dart';
import 'get_new_emp_image.dart';

class UploadEmpInfoToSupabase {
  final DataService service;
  ConvertImagesToPdf convertImagesToPdf = ConvertImagesToPdf();
  GetNewEmpImage image = GetNewEmpImage();
  UploadEmpInfoToSupabase(this.service);
  final supabase = Supabase.instance.client;

  Future<Either<CustomError, EmpModel>> uploadEmpInfoToSupabase(
    Map<String, dynamic> data,
  ) async {
    return await service.addData(
      table: BackendPoint.emp,
      data: data,
      fromJson: EmpModel.fromJson,
    );
  }

  Future<String> convertImageToPDFAndUpload({
    required List<File> images,
    required String companyID,
    required String nid,
  }) async {
    final storage = supabase.storage.from(BackendPoint.imageBucket);
    final pdfBytes = await ConvertImagesToPdf().generatePdfFromImages(images);
    final fileName =
        '$companyID/$nid/pdfs/${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Upload the PDF
    await storage.uploadBinary(
      fileName,
      pdfBytes,
      fileOptions: const FileOptions(contentType: 'application/pdf'),
    );

    // Get the public URL of the uploaded PDF
    final response = storage.getPublicUrl(fileName);

    return response;
  }

  Future<String> uploadImage({
    required File image,
    required String companyID,
    required String nid,
  }) async {
    final storage = supabase.storage.from(BackendPoint.imageBucket);
    final fileName =
        '$companyID/$nid/images/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await storage.upload(fileName, image);
    final response = storage.getPublicUrl(fileName);
    return response;
  }
}
