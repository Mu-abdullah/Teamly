import '../../../../../core/entities/vacation_entity.dart';

class UserCheckVacationModel extends VacationEntity {
  UserCheckVacationModel({required super.id});

  factory UserCheckVacationModel.fromJson(Map<String, dynamic> json) =>
      UserCheckVacationModel(id: json['id']);

  Map<String, dynamic> toJson() => {'id': id};
}
