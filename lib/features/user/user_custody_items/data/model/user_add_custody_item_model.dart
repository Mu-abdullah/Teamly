import '../../../../../core/entities/custody_transaction_item_entity.dart';

class UserAddCustodyItemModel extends CustodyTransactionItemEntity {
  UserAddCustodyItemModel({
    super.count,
    super.name,
    super.price,
    super.transactionId,
    super.createdAt,
    super.id,
    super.user,
  });

  factory UserAddCustodyItemModel.fromJson(Map<String, dynamic> json) =>
      UserAddCustodyItemModel(
        count: json['count'],
        name: json['name'],
        price: json['price'],
        transactionId: json['transaction_id'],
        createdAt: json['created_at'],
        id: json['id'],
        user: json['user'],
      );

  Map<String, dynamic> toJson() => {
    'count': count,
    'name': name,
    'price': price,
    'transaction_id': transactionId,
    'created_at': createdAt,
    'id': id,
    'user': user,
  };
}
