import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

class ConvertImagesToPdf {
  Future<Uint8List> generatePdfFromImages(List<File> images) async {
    final pdf = pw.Document();

    for (var img in images) {
      final imageBytes = await img.readAsBytes();
      final image = pw.MemoryImage(imageBytes);
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(child: pw.Image(image)),
        ),
      );
    }

    return pdf.save(); // Already returns Uint8List
  }
}
