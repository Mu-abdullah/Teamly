class TimestampToTime {
  static String time({
    required dynamic timestamp,
    bool isMilliseconds = false,
    String format = 'dd/MM/yyyy hh:mm a',
  }) {
    try {
      DateTime dateTime;

      if (timestamp is String) {
        // Check if the string is in ISO 8601 format
        if (timestamp.contains('T')) {
          dateTime = DateTime.parse(timestamp).toLocal();
        } else {
          // Assume it's a string representation of an integer timestamp
          int parsedTimestamp = int.parse(timestamp);
          dateTime = isMilliseconds
              ? DateTime.fromMillisecondsSinceEpoch(parsedTimestamp)
              : DateTime.fromMillisecondsSinceEpoch(parsedTimestamp * 1000);
        }
      } else if (timestamp is int) {
        // If the timestamp is an integer, use it directly
        dateTime = isMilliseconds
            ? DateTime.fromMillisecondsSinceEpoch(timestamp)
            : DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      } else {
        throw ArgumentError('Timestamp must be a String or int.');
      }

      // Format the time
      return _formatDateTime(dateTime, format);
    } catch (e) {
      throw Exception('Failed to convert timestamp to time: $e');
    }
  }

  static String _formatDateTime(DateTime dateTime, String format) {
    switch (format) {
      case 'HH:mm':
        return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
      case 'hh:mm a':
        final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
        final period = dateTime.hour < 12 ? 'AM' : 'PM';
        return '${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $period';
      case 'dd/MM/yyyy hh:mm a':
        final day = dateTime.day.toString().padLeft(2, '0');
        final month = dateTime.month.toString().padLeft(2, '0');
        final year = dateTime.year.toString();
        final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
        final period = dateTime.hour < 12 ? 'AM' : 'PM';
        return '$day/$month/$year $hour:${dateTime.minute.toString().padLeft(2, '0')} $period';
      default:
        throw ArgumentError('Unsupported format: $format');
    }
  }
}
