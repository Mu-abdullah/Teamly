import '../../../../../core/entities/vacation_entity.dart';

class UserCheckVacationModel extends VacationEntity {
  UserCheckVacationModel({
    required super.id,
    required super.type,
    required super.status,
  });

  factory UserCheckVacationModel.fromJson(Map<String, dynamic> json) =>
      UserCheckVacationModel(
        id: json['id'],
        type: json['type'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {'id': id, 'type': type, 'status': status};
}
