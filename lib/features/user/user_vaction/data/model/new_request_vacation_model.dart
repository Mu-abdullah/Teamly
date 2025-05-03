import '../../../../../core/entities/vacation_entity.dart';

class NewRequestVacationModel extends VacationEntity {
  NewRequestVacationModel({
    required super.id,
    required super.createdAt,
    required super.comId,
    required super.userId,
    required super.empId,
    required super.type,
    required super.startDate,
    required super.endDate,
    required super.reason,
  });

  factory NewRequestVacationModel.fromJson(Map<String, dynamic> json) =>
      NewRequestVacationModel(
        id: json['id'],
        createdAt: json['created_at'],
        comId: json['com_id'],
        userId: json['user_id'],
        empId: json['emp_id'],
        type: json['type'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        reason: json['reason'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt,
    'com_id': comId,
    'user_id': userId,
    'emp_id': empId,
    'type': type,
    'start_date': startDate,
    'end_date': endDate,
    'reason': reason,
  };
}
