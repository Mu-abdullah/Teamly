import '../../../../../core/entities/custody_entity.dart';

class CustodyModel extends CustodyEntity {
  CustodyModel({
    super.id,
    super.name,
    super.totalAmount,
    super.status,
    super.approvedBy,
    super.companyId,
    super.createdAt,
    super.note,
  });

  factory CustodyModel.fromJson(Map<String, dynamic> json) {
    return CustodyModel(
      id: json['id'],
      createdAt: json['created_at'],
      companyId: json['company_id'],
      totalAmount: json['total_amount'],
      name: json['name'],
      status: json['status'],
      approvedBy: json['approved_by'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'total_amount': totalAmount,
    'status': status,
    'approved_by': approvedBy,
    'company_id': companyId,
    'created_at': createdAt,
    'note': note,
  };
}
