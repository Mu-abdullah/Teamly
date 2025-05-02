class PositionsEntity {
  final String? id;
  final String? createdAt;
  final String? positionName;
  final String? company;

  PositionsEntity({this.id, this.createdAt, this.positionName, this.company});
}

class EmpPositionModel extends PositionsEntity {
  EmpPositionModel({required super.positionName});

  factory EmpPositionModel.fromJson(Map<String, dynamic> json) =>
      EmpPositionModel(positionName: json['position']);

  Map<String, dynamic> toJson() => {'position': positionName};
}
