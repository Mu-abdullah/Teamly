class CustodyEntity {
  final dynamic id;
  final String? name;
  final String? totalAmount;
  final String? status;
  final dynamic approvedBy;
  final String? note;
  final String? createdAt;

  const CustodyEntity({
    this.id,
    this.name,
    this.totalAmount,
    this.status,
    this.approvedBy,
    this.note,
    this.createdAt,
  });
}
