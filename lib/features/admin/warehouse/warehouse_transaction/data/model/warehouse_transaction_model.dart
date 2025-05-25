import '../../../../../../core/entities/warehouse_transaction_entity.dart';

class WarehouseTransactionModel extends WarehouseTransactionEntity {
  final String? sku;
  final String? position;
  final String? price;
  final String? category;
  final String? unitType;

  WarehouseTransactionModel({
    required super.createdAt,
    required super.emp,
    required super.quantity,
    required super.warehouse,
    required this.position,
    required this.sku,
    required this.price,
    required this.category,
    required this.unitType,
  });

  factory WarehouseTransactionModel.fromJson(Map<String, dynamic> json) {
    return WarehouseTransactionModel(
      createdAt: json['created_at'],
      emp: json['emp']['name'],
      position: json['emp']['position']['position'],
      quantity: json['quantity'],
      sku: json['warehouse']['sku'],
      warehouse: json['warehouse']['name'],
      price: json['warehouse']['price'],
      category: json['warehouse']['category'],
      unitType: json['warehouse']['unit_type'],
    );
  }



  // calculate total price
  double calculateTotal() {
    final pric = double.tryParse(price ?? '') ?? 0.0;
    final coun = double.tryParse(quantity ?? '') ?? 0.0;
    return (pric * coun);
  }


}
