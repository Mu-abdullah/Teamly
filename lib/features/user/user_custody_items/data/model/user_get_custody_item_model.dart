import '../../../../../core/entities/custody_transaction_item_entity.dart';

class UserGetCustodyItemModel extends CustodyTransactionItemEntity {
  UserGetCustodyItemModel({
    super.count,
    super.name,
    super.price,
    super.transactionId,
    super.createdAt,
    super.id,
    super.user,
  });

  factory UserGetCustodyItemModel.fromJson(Map<String, dynamic> json) =>
      UserGetCustodyItemModel(
        count: json['count'],
        name: json['name'],
        price: json['price'],
        transactionId: json['transaction_id'],
        createdAt: json['created_at'],
        id: json['id'],
        user: json['users']['emp']['name'],
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

  // calc total price
  double get totalPrice => double.parse(count!) * double.parse(price!);
}
