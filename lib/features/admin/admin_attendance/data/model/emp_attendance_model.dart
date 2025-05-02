import '../../../../../core/entities/emp_entity.dart';
import '../../../../../core/entities/positions_entity.dart';

class EmpAttendanceModel extends EmpEntity {
  final EmpPositionModel? position;
  EmpAttendanceModel({
    required super.id,
    required super.name,
    required this.position,
  });

  factory EmpAttendanceModel.fromJson(Map<String, dynamic> json) =>
      EmpAttendanceModel(
        id: json["id"],
        name: json["name"],
        position:
            json["position"] != null
                ? EmpPositionModel.fromJson(json["position"])
                : null,
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position!.toJson(),
  };
}
