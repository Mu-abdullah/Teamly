import '../../../../../core/entities/attendance_entity.dart';
import 'emp_attendance_model.dart';

class MonthAdminAttendance extends AttendanceEntity {
  final EmpAttendanceModel? emp;
  MonthAdminAttendance({
    super.id,
    super.date,
    super.checkIn,
    super.checkOut,
    super.companyId,
    super.userId,
    this.emp,
  });

  factory MonthAdminAttendance.fromJson(Map<String, dynamic> json) =>
      MonthAdminAttendance(
        id: json['id'],
        date: json['date'],
        checkIn: json['check_in'],
        checkOut: json['check_out'],
        companyId: json['comp_id'],
        userId: json['user_id'],
        emp: EmpAttendanceModel.fromJson(json['emp']),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'check_in': checkIn,
    'check_out': checkOut,
    'comp_id': companyId,
    'user_id': userId,
    'emp': emp,
  };
}
