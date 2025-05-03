import 'package:teamly/core/entities/emp_entity.dart';

import '../../../../../core/entities/vacation_entity.dart';

class UserRequestsVacations extends VacationEntity {
  AdminRequest? admin;
  UserRequestsVacations({
    super.id,
    super.createdAt,
    super.comId,
    super.userId,
    super.empId,
    super.type,
    super.startDate,
    super.endDate,
    super.reason,
    super.status,
    super.updatedAt,
    super.rejectReason,
    this.admin,
  });

  factory UserRequestsVacations.fromJson(Map<String, dynamic> json) =>
      UserRequestsVacations(
        id: json['id'],
        createdAt: json['created_at'],
        comId: json['com_id'],
        userId: json['user_id'],
        empId: json['emp_id'],
        type: json['type'],
        startDate: json['start_date'],
        endDate: json['end_date'],
        reason: json['reason'],
        status: json['status'],
        updatedAt: json['updated_at'],
        rejectReason: json['reject_reason'],
        admin:
            json['users'] != null && json['users']['emp'] != null
                ? AdminRequest.fromJson(json['users']['emp'])
                : null,
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
    'status': status,
    'updated_at': updatedAt,
    'reject_reason': rejectReason,
    'admin': admin?.toJson(),
  };
}

class AdminRequest extends EmpEntity {
  AdminRequest({super.name});

  factory AdminRequest.fromJson(Map<String, dynamic> json) =>
      AdminRequest(name: json['name']);

  Map<String, dynamic> toJson() => {'name': name};
}
