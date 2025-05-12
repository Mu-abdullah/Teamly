import '../../../../core/entities/emp_entity.dart';

class EmpModel extends EmpEntity {
  EmpModel({
     super.id,
     super.createdAt,
     super.name,
     super.nid,
     super.address,
     super.phone,
     super.salary,
     super.startIn,
     super.startEnd,
     super.endJobReason,
     super.jobStatus,
     super.comId,
     super.position,
     super.gender,
     super.papers,
     super.image
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
    position: json["position"]['position'],
    gender: json["gender"],
    papers: json["papers"],
    image: json["image"],
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
    "position": position,
    "gender": gender,
    "papers": papers,
    "image": image,
  };
}
