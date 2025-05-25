import '../../../../../../core/entities/werehouse_entity.dart';

class WarehouseCategotiesModel extends WarehouseEntity {
  WarehouseCategotiesModel({required super.category, super.unitType});
  factory WarehouseCategotiesModel.fromJson(Map<String, dynamic> json) {
    return WarehouseCategotiesModel(
      unitType: json['unit_type'],
      category: json['category'],
    );
  }
}
