import '../../../../../core/entities/vacation_entity.dart';

class VacationCount extends VacationEntity {
  VacationCount({required super.id, required super.status});

  factory VacationCount.fromJson(Map<String, dynamic> json) =>
      VacationCount(id: json['id'], status: json['status']);

  Map<String, dynamic> toJson() => {'id': id, 'status': status};
}
