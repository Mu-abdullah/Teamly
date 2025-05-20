import '../../../../../../core/entities/vacation_entity.dart';

class ReviewVacationModel extends VacationEntity {
  ReviewVacationModel({
    super.id,
    super.empId,
    super.createdAt,
    super.userId,
    super.reason,
    super.startDate,
    super.endDate,
    super.type,
  });

  factory ReviewVacationModel.fromJson(Map<String, dynamic> json) =>
      ReviewVacationModel(
        id: json['id'],
        empId: json['emp']?['name'],
        createdAt: json['created_at'],
        userId: json["users"]['emp']["name"],
        reason: json['reason'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'emp_id': empId,
    'created_at': createdAt,
    'user_id': userId,
    'reason': reason,
    'start_date': startDate,
    'end_date': endDate,
    'type': type,
  };
}
