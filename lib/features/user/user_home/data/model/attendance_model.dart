import '../../../../../core/entities/attendance_entity.dart';

class AttendanceModel extends AttendanceEntity {
  AttendanceModel({
    super.id,
    super.date,
    super.checkIn,
    super.checkOut,
    super.companyId,
    super.userId,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        id: json['id'],
        date: json['date'],
        checkIn: json['check_in'],
        checkOut: json['check_out'],
        companyId: json['comp_id'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'check_in': checkIn,
    'check_out': checkOut,
    'comp_id': companyId,
    'user_id': userId,
  };
}
