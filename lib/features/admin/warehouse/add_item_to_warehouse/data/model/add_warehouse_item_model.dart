import '../../../../../../core/entities/werehouse_entity.dart';

class AddWarehouseItemModel extends WarehouseEntity {
  AddWarehouseItemModel({
    required super.createdAt,
    required super.sku,
    required super.category,
    required super.unitType,
    required super.name,
    required super.price,
    required super.quantity,
    required super.available,
    required super.id,
    required super.comp,
  });

  factory AddWarehouseItemModel.fromJson(Map<String, dynamic> json) {
    return AddWarehouseItemModel(
      createdAt: json['created_at'],
      sku: json['sku'],
      category: json['category'],
      unitType: json['unit_type'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      available: json['available'],
      id: json['id'],
      comp: json['comp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt,
      'sku': sku,
      'category': category,
      'unit_type': unitType,
      'name': name,
      'price': price,
      'quantity': quantity,
      'available': available,
      'id': id,
      'comp': comp,
    };
  }
}
