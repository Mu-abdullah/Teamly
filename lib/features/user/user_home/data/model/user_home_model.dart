import '../../../../../core/entities/emp_entity.dart';
import '../../../../../core/entities/gender_model.dart';
import '../../../../../core/entities/positions_entity.dart';

class UserHomeModel extends EmpEntity {
  final GenderModel? gend;
  final EmpPositionModel? position;
  @override
  UserHomeModel({
    required super.id,
    required super.name,
    required super.phone,
    required this.gend,
    required this.position,
  });

  factory UserHomeModel.fromJson(Map<String, dynamic> json) => UserHomeModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    gend: json['gender'] != null ? GenderModel.fromJson(json['gender']) : null,
    position:
        json['position'] != null
            ? EmpPositionModel.fromJson(json['position'])
            : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'gender': gend?.toJson(),
    'position': position?.toJson(),
  };
}
