import 'package:intl/intl.dart';

class GenerateId {
  static Future<String> generateDocumentId() async {
    try {
      final DateTime now = DateTime.now();
      final String date = DateFormat('yyMMddHHmmss', 'en').format(now);

      return 'RAHAAL$date';
    } catch (e) {
      throw Exception('Failed to generate document ID: $e');
    }
  }
}
