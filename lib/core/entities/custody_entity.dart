class CustodyEntity {
  final String? id;
  final String? name;
  final String? description;
  final String? amount;
  final String? status;
  final String? notes;
  final String? assignedTo;
  final String? approvedBy;
  final DateTime? createdAt;

  const CustodyEntity({
    this.id,
    this.name,
    this.description,
    this.amount,
    this.status,
    this.notes,
    this.assignedTo,
    this.approvedBy,
    this.createdAt,
  });
}
