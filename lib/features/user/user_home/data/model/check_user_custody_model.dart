import '../../../../../core/entities/custody_transaction_entity.dart';

class CheckUserCustodyModel extends CustodyTransactionEntity {
  CheckUserCustodyModel({
    required super.custodyId,
    required super.empId,
    required super.amount,
  });

  factory CheckUserCustodyModel.fromJson(Map<String, dynamic> json) {
    return CheckUserCustodyModel(
      custodyId: json['custody_id'],
      empId: json['emp_id'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() => {
    'custody_id': custodyId,
    'emp_id': empId,
    'amount': amount,
  };
}
