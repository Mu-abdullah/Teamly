import '../../../../../../core/entities/emp_entity.dart';

class CustodyEmpModel extends EmpEntity {
  CustodyEmpModel({required super.id, required super.name, super.position});

  factory CustodyEmpModel.fromJson(Map<String, dynamic> json) {
    return CustodyEmpModel(
      id: json['id'],
      name: json['name'],
      position: json['position']['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'position': position};
  }
}
