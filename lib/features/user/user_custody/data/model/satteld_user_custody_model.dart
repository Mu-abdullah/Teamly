import '../../../../../core/entities/custody_transaction_entity.dart';

class SatteldUserCustodyModel extends CustodyTransactionEntity {
  SatteldUserCustodyModel({super.status});

  factory SatteldUserCustodyModel.fromJson(Map<String, dynamic> json) {
    return SatteldUserCustodyModel(status: json['status']);
  }

  Map<String, dynamic> toJson() => {'status': status};
}
