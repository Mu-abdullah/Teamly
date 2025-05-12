import '../../../../../core/entities/emp_entity.dart';

class HomeEmpModel extends EmpEntity {
  HomeEmpModel({
    super.id,
    super.name,
    super.phone,
    super.position,
    super.image,
  });

  factory HomeEmpModel.fromJson(Map<String, dynamic> json) => HomeEmpModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    position: json['position']['position'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'position': position,
    'image': image,
  };
}
