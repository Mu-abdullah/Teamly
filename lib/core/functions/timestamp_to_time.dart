import 'package:intl/intl.dart';

class TimeRefactor {
  final String timestamp;

  TimeRefactor(this.timestamp);

  // Convert timestamp to date format: yyyy/MM/dd
  String toDateString() {
    try {
      final dateTime = DateTime.parse(timestamp);
      return DateFormat('yyyy/MM/dd').format(dateTime);
    } catch (e) {
      return 'Invalid timestamp';
    }
  }

  // Convert timestamp to time format: HH:mm
  String toTimeString() {
    try {
      final dateTime = DateTime.parse(timestamp);
      return DateFormat('hh:mm a').format(dateTime);
    } catch (e) {
      return 'Invalid timestamp';
    }
  }

  // Calculate time difference between this timestamp and another in minutes
  String timeDifferenceInHoursAndMinutes(String otherTimestamp) {
    try {
      final dateTime1 = DateTime.parse(timestamp);
      final dateTime2 = DateTime.parse(otherTimestamp);
      final difference = dateTime1.difference(dateTime2).abs();
      final hours = difference.inHours;
      final minutes = difference.inMinutes.remainder(60);
      return '$hours ساعة, $minutes دقيقة';
    } catch (e) {
      return 'Invalid timestamps';
    }
  }

  static String currentDateString() {
    final now = DateTime.now();
    return DateFormat('yyyy/MM/dd').format(now);
  }
}
