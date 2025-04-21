class CustodyEntity {
  final int? id;
  final String? name;
  final String? amount;
  final String? status;
  final String? notes;
  final String? approvedBy;
  final DateTime? createdAt;

  const CustodyEntity({
    this.id,
    this.name,
    this.amount,
    this.status,
    this.notes,
    this.approvedBy,
    this.createdAt,
  });
}
