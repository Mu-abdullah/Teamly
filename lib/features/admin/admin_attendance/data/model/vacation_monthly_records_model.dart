import '../../../../../core/entities/vacation_entity.dart';

class VacationMonthlyRecordsModel extends VacationEntity {
  VacationMonthlyRecordsModel({
    required super.id,
    required super.empId,
    required super.userId,
    required super.startDate,
    required super.endDate,
    required super.status,
    super.reason,
  });

  factory VacationMonthlyRecordsModel.fromJson(Map<String, dynamic> json) {
    return VacationMonthlyRecordsModel(
      id: json['id'],
      empId: json['emp']['id'],
      userId: json['users']['emp']['name'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      status: json['status'],
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'emp_id': empId,
    'user_id': userId,
    'start_date': startDate,
    'end_date': endDate,
    'status': status,
    'reason': reason,
  };
}
