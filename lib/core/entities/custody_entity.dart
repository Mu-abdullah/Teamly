class CustodyEntity {
  final String? id;
  final String? createdAt;
  final String? companyId;
  final String? totalAmount;
  final String? name;
  final String? status;
  final String? approvedBy;
  final String? note;

  const CustodyEntity({
    this.id,
    this.name,
    this.totalAmount,
    this.status,
    this.approvedBy,
    this.companyId,
    this.note,
    this.createdAt,
  });
}
