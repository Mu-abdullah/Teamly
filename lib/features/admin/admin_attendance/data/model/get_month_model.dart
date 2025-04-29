import '../../../../../core/entities/attendance_entity.dart';

class GetMonthModel extends AttendanceEntity {
  GetMonthModel({required super.date});

  factory GetMonthModel.fromJson(Map<String, dynamic> json) {
    return GetMonthModel(date: json['date']);
  }

  Map<String, dynamic> toJson() => {'date': date};
}
