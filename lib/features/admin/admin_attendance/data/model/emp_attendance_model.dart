import '../../../../../core/entities/emp_entity.dart';

class EmpAttendanceModel extends EmpEntity {
  EmpAttendanceModel({
    required super.id,
    required super.name,
    required super.position,
  });

  factory EmpAttendanceModel.fromJson(Map<String, dynamic> json) =>
      EmpAttendanceModel(
        id: json["id"],
        name: json["name"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position,
  };
}
