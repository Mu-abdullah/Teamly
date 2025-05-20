import '../../../../../../core/entities/custody_transaction_item_entity.dart';

class GetCustodyTransItemModel extends CustodyTransactionItemEntity {
  GetCustodyTransItemModel({
    required super.transactionId,
    required super.name,
    required super.count,
    required super.price,
  });

  factory GetCustodyTransItemModel.fromJson(Map<String, dynamic> json) {
    return GetCustodyTransItemModel(
      transactionId: json['transaction_id'],
      name: json['name'],
      count: json['count'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['transaction_id'] = transactionId;
    data['name'] = name;
    data['count'] = count;
    data['price'] = price;
    return data;
  }

  // calc total price
  double calculateTotal() {
    final pric = double.tryParse(price ?? '') ?? 0.0;
    final coun = double.tryParse(count ?? '') ?? 0.0;
    return (pric * coun);
  }
}
