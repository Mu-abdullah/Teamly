import '../../../../core/entities/emp_entity.dart';
import '../../../../core/entities/positions_entity.dart';

class EmpModel extends EmpEntity {
  final EmpPositionModel position;
  EmpModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.nid,
    required super.address,
    required super.phone,
    required super.salary,
    required super.startIn,
    required super.startEnd,
    required super.endJobReason,
    required super.jobStatus,
    required super.comId,
    required this.position,
  });

  factory EmpModel.fromJson(Map<String, dynamic> json) => EmpModel(
    id: json["id"],
    createdAt: json["created_at"],
    name: json["name"],
    nid: json["nid"],
    address: json["address"],
    phone: json["phone"],
    salary: json["salary"],
    startIn: json["start_in"],
    startEnd: json["start_end"],
    endJobReason: json["end_job_reason"],
    jobStatus: json["job_status"],
    comId: json["com_id"],
    position: EmpPositionModel.fromJson(json["position"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "name": name,
    "nid": nid,
    "address": address,
    "phone": phone,
    "salary": salary,
    "start_in": startIn,
    "start_end": startEnd,
    "end_job_reason": endJobReason,
    "job_status": jobStatus,
    "com_id": comId,
    "position": position.toJson(),
  };
}
