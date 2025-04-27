import '../../../../../core/entities/attendance_entity.dart';

class CheckAttendanceModel extends AttendanceEntity {
  CheckAttendanceModel({super.checkIn, super.checkOut, super.userId});

  factory CheckAttendanceModel.fromJson(Map<String, dynamic> json) =>
      CheckAttendanceModel(
        checkIn: json['check_in'],
        checkOut: json['check_out'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
    'check_in': checkIn,
    'check_out': checkOut,
    'user_id': userId,
  };
}
