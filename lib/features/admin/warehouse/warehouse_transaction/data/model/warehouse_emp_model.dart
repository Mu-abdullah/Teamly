import '../../../../../../core/entities/emp_entity.dart';

class WarehouseEmpModel extends EmpEntity {
  WarehouseEmpModel({
    required super.id,
    required super.name,
    required super.position,
  });

  factory WarehouseEmpModel.fromJson(Map<String, dynamic> json) {
    return WarehouseEmpModel(
      id: json['id'],
      name: json['name'],
      position: json['position']['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'position': position};
  }
}
