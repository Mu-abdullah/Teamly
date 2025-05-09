import '../../../../../core/entities/custody_entity.dart';

class UpdateCustodyStatusModel extends CustodyEntity {
  UpdateCustodyStatusModel({required super.id, required super.status});

  factory UpdateCustodyStatusModel.fromJson(Map<String, dynamic> json) {
    return UpdateCustodyStatusModel(id: json['id'], status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'status': status};
  }
}
