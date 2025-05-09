import '../../../../../core/entities/custody_transaction_entity.dart';

class UserCustodyModel extends CustodyTransactionEntity {
  UserCustodyModel({
    super.id,
    super.amount,
    super.createdAt,
    super.custodyId,
    super.userId,
    super.status,
  });

  factory UserCustodyModel.fromJson(Map<String, dynamic> json) {
    return UserCustodyModel(
      id: json['id'],
      amount: json['amount'],
      createdAt: json['created_at'],
      custodyId: json['custody_id'],
      userId: json['users']['emp']['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'created_at': createdAt,
    'custody_id': custodyId,
    'user_id': userId,
    'status': status,
  };
}
