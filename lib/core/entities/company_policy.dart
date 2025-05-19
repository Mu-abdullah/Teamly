import 'package:flutter/material.dart';

class CompanyPolicy {
  final List<String>? workDays;
  final List<String>? weeklyOffDays;
  final TimeOfDay? workStartTime;
  final TimeOfDay? workEndTime;
  final int? gracePeriod;
  final List<DateTime>? officialHolidays;

  CompanyPolicy({
    this.workDays,
    this.weeklyOffDays,
    this.workStartTime,
    this.workEndTime,
    this.gracePeriod,
    this.officialHolidays,
  });

  factory CompanyPolicy.fromJson(Map<String, dynamic> json) {
    return CompanyPolicy(
      workDays: (json['work_days'] as List<dynamic>?)?.cast<String>() ?? [],
      weeklyOffDays:
          (json['weekly_off_days'] as List<dynamic>?)?.cast<String>() ?? [],
      workStartTime: _parseTime(json['work_start_time'] as String?),
      workEndTime: _parseTime(json['work_end_time'] as String?),
      gracePeriod: json['grace_period'] as int? ?? 0,
      officialHolidays:
          (json['official_holidays'] as List<dynamic>?)?.map((d) {
            try {
              return DateTime.parse(d as String);
            } catch (e) {
              print('Error parsing holiday date: $d, Error: $e');
              return DateTime(1970, 1, 1); // Fallback date
            }
          }).toList() ??
          [],
    );
  }

  static TimeOfDay? _parseTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) return null;
    try {
      final parts = timeString.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      print('Error parsing time string: $timeString, Error: $e');
      return null;
    }
  }
}
