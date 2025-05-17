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
      workDays: List<String>.from(json['work_days']),
      weeklyOffDays: List<String>.from(json['weekly_off_days']),
      workStartTime: _parseTime(json['work_start_time']),
      workEndTime: _parseTime(json['work_end_time']),
      gracePeriod: json['grace_period'] as int,
      officialHolidays:
          (json['official_holidays'] as List)
              .map((d) => DateTime.parse(d))
              .toList(),
    );
  }

  static TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
