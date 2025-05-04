import '../../../../../core/entities/custody_transaction_entity.dart';

class CustodyTransactionModel extends CustodyTransactionEntity {
  CustodyTransactionModel({
    super.id,
    super.createdAt,
    super.custodyId,

    super.personId,
    super.amount,
  });
  factory CustodyTransactionModel.fromJson(Map<String, dynamic> json) {
    return CustodyTransactionModel(
      id: json['id'],
      createdAt: json['created_at'],
      custodyId: json['custody_id'],
      personId: json['person_id'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'custody_id': custodyId,
      'person_id': personId,
      'amount': amount,
    };
  }

  // sum all amoute in double
  static double sumAmount(List<CustodyTransactionModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum += double.parse(transaction.amount!);
    }
    return sum;
  }
}
