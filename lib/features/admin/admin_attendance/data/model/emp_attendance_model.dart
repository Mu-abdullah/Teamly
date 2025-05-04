import '../../../../../core/entities/emp_entity.dart';

class EmpAttendanceModel extends EmpEntity {
  EmpAttendanceModel({super.id, super.name, super.position});

  factory EmpAttendanceModel.fromJson(Map<String, dynamic> json) =>
      EmpAttendanceModel(
        id: json["id"],
        name: json["name"],
        position: json["position"]['position'],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position,
  };
}
