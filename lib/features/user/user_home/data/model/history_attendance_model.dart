import '../../../../../core/entities/attendance_entity.dart';

class HistoryAttendanceModel extends AttendanceEntity {
  HistoryAttendanceModel({super.date, super.checkIn, super.checkOut});

  factory HistoryAttendanceModel.fromJson(Map<String, dynamic> json) =>
      HistoryAttendanceModel(
        date: json['date'],
        checkIn: json['check_in'],
        checkOut: json['check_out'],
      );

  Map<String, dynamic> toJson() => {
    'date': date,
    'check_in': checkIn,
    'check_out': checkOut,
  };
}
