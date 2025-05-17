import '../../../../../core/entities/vacation_entity.dart';

class UserCheckVacationModel extends VacationEntity {
  String gender;
  UserCheckVacationModel({
    required super.id,
    required super.type,
    required super.status,
    required this.gender,
  });

  factory UserCheckVacationModel.fromJson(Map<String, dynamic> json) =>
      UserCheckVacationModel(
        id: json['id'],
        type: json['type'],
        status: json['status'],
        gender: json['emp']['gender']['gender'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'status': status,
    'gender': gender,
  };
}
