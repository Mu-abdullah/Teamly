import '../../../../../../core/entities/vacation_entity.dart';

class VacationResponseModel extends VacationEntity {
  VacationResponseModel({super.status, super.rejectReason, super.updatedAt});

  factory VacationResponseModel.fromJson(Map<String, dynamic> json) {
    return VacationResponseModel(
      status: json['status'],
      rejectReason: json['reject_reason'],
      updatedAt: json['updated_at'],
    );
  }
  Map<String, dynamic> toJson() => {
    'status': status,
    'reject_reason': rejectReason,
    'updated_at': updatedAt,
  };
}
