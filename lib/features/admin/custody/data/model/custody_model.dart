import '../../../../../core/entities/custody_entity.dart';

class CustodyModel extends CustodyEntity {
  CustodyModel({
    super.id,
    super.name,
    super.totalAmount,
    super.status,
    super.approvedBy,
    super.createdAt,
    super.note,
  });

  factory CustodyModel.fromJson(Map<String, dynamic> json) {
    return CustodyModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      totalAmount: json['total_amount'] as String?,
      status: json['status'] as String?,
      approvedBy: json['approved_by'] as int?,
      createdAt: json['created_at'] as String,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'total_amount': totalAmount,
    'status': status,
    'approved_by': approvedBy,
    'created_at': createdAt,
    'note': note,
  };
}
