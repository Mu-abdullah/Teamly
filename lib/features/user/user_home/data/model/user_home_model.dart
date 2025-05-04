import '../../../../../core/entities/emp_entity.dart';
import '../../../../../core/entities/gender_model.dart';

class UserHomeModel extends EmpEntity {
  final GenderModel? gend;

  @override
  UserHomeModel({
    required super.id,
    required super.name,
    required super.phone,
    required this.gend,
    required super.position,
  });

  factory UserHomeModel.fromJson(Map<String, dynamic> json) => UserHomeModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    gend: json['gender'] != null ? GenderModel.fromJson(json['gender']) : null,
    position: json['position']['position'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'gender': gend?.toJson(),
    'position': position,
  };
}
