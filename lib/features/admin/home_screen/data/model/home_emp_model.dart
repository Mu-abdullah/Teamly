import '../../../../../core/entities/emp_entity.dart';

class HomeEmpModel extends EmpEntity {
  HomeEmpModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.position,
  });

  factory HomeEmpModel.fromJson(Map<String, dynamic> json) => HomeEmpModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    position: json['position'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'position': position,
  };
}
