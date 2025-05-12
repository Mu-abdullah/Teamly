import '../../../../../core/entities/positions_entity.dart';

class NewEmpPositionsModel extends PositionsEntity {
  NewEmpPositionsModel({required super.positionName, required super.id});

  factory NewEmpPositionsModel.fromJson(Map<String, dynamic> json) =>
      NewEmpPositionsModel(positionName: json['position'], id: json['id']);

  Map<String, dynamic> toJson() => {'position': positionName, 'id': id};
}
