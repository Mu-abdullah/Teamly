import '../../../../../core/entities/custody_transaction_entity.dart';

class CustodyTransactionModel extends CustodyTransactionEntity {
  CustodyTransactionModel({
    super.id,
    super.createdAt,
    super.custodyId,
    super.userId,
    super.empId,
    super.amount,
    super.status
  });
  factory CustodyTransactionModel.fromJson(Map<String, dynamic> json) {
    return CustodyTransactionModel(
      id: json['id'],
      createdAt: json['created_at'],
      custodyId: json['custody_id'],
      userId: json['users']['emp']['name'],
      empId: json['emp']['name'],
      amount: json['amount'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'custody_id': custodyId,
      'user_id': userId,
      'emp_id': empId,
      'amount': amount,
      'status': status
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
