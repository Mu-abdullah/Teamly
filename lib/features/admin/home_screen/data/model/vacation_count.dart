import '../../../../../core/entities/vacation_entity.dart';

class VacationCount extends VacationEntity {
  VacationCount({required super.id});

  factory VacationCount.fromJson(Map<String, dynamic> json) =>
      VacationCount(id: json['id']);

  Map<String, dynamic> toJson() => {'id': id};
}
