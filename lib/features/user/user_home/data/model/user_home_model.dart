import '../../../../../core/entities/emp_entity.dart';

class UserHomeModel extends EmpEntity {
  @override
  UserHomeModel({
    super.id,
    super.name,
    super.phone,
    super.gender,
    super.position,
  });

  factory UserHomeModel.fromJson(Map<String, dynamic> json) => UserHomeModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    gender: json['gender']['gender'],
    position: json['position']['position'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'gender': gender,
    'position': position,
  };
}
