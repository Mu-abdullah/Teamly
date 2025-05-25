import '../../../../../../core/entities/warehouse_transaction_entity.dart';

class ExistItemModel extends WarehouseTransactionEntity {
  const ExistItemModel({
    required super.id,
    required super.warehouse,
    required super.emp,
    required super.createdAt,
    required super.quantity,
  });

  factory ExistItemModel.fromJson(Map<String, dynamic> json) => ExistItemModel(
    id: json['id'] as String,
    warehouse: json['warehouse'] as String,
    emp: json['emp'] as String,
    createdAt: json['created_at'] as String,
    quantity: json['quantity'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'warehouse': warehouse,
    'emp': emp,
    'created_at': createdAt,
    'quantity': quantity,
  };
}
