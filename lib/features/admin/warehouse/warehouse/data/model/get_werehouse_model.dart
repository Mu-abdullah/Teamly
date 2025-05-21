import '../../../../../../core/entities/werehouse_entity.dart';

class GetWarehouseModel extends WarehouseEntity {
  GetWarehouseModel({
    required super.createdAt,
    required super.sku,
    required super.category,
    required super.unitType,
    required super.name,
    required super.price,
    required super.quantity,
    required super.available,
  });

  factory GetWarehouseModel.fromJson(Map<String, dynamic> json) {
    return GetWarehouseModel(
      createdAt: json['created_at'],
      sku: json['sku'],
      category: json['category'],
      unitType: json['unit_type'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      available: json['available'],
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
    };
  }

  double calculateTotal() {
    final pric = double.tryParse(price ?? '') ?? 0.0;
    final coun = double.tryParse(quantity ?? '') ?? 0.0;
    return (pric * coun);
  }
}
