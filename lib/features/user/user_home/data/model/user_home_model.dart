import '../../../../../core/entities/emp_entity.dart';
import '../../../../../core/entities/gender_model.dart';

class UserHomeModel extends EmpEntity {
  final GenderModel? gend;
  @override
  UserHomeModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.position,
    required this.gend,
  });

  factory UserHomeModel.fromJson(Map<String, dynamic> json) => UserHomeModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    position: json['position'],
    gend: json['gender'] != null ? GenderModel.fromJson(json['gender']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'position': position,
    'gender': gend?.toJson(),
  };
}
