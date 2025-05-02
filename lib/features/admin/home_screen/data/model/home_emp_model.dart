import '../../../../../core/entities/emp_entity.dart';
import '../../../../../core/entities/positions_entity.dart';

class HomeEmpModel extends EmpEntity {
  final EmpPositionModel? position;
  HomeEmpModel({
    required super.id,
    required super.name,
    required super.phone,
    required this.position,
  });

  factory HomeEmpModel.fromJson(Map<String, dynamic> json) => HomeEmpModel(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    position:
        json['position'] != null
            ? EmpPositionModel.fromJson(json['position'])
            : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'position': position!.toJson(),
  };
}
