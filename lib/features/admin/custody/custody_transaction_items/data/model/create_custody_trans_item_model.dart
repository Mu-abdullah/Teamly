import '../../../../../../core/entities/custody_transaction_item_entity.dart';

class CreateCustodyTransItemModel extends CustodyTransactionItemEntity {
  CreateCustodyTransItemModel({
    required super.id,
    required super.createdAt,
    required super.transactionId,
    required super.name,
    required super.count,
    required super.price,
    required super.user,
  });

  factory CreateCustodyTransItemModel.fromJson(Map<String, dynamic> json) =>
      CreateCustodyTransItemModel(
        id: json['id'],
        createdAt: json['created_at'],
        transactionId: json['transaction_id'],
        name: json['name'],
        count: json['count'],
        price: json['price'],
        user: json['user'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt,
    'transaction_id': transactionId,
    'name': name,
    'count': count,
    'price': price,
    'user': user,
  };
}
