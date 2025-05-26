import '../../../../../../core/entities/emp_entity.dart';

class AllEmpModel extends EmpEntity {
  AllEmpModel({
    required super.id,
    required super.name,
    required super.position,
    required super.image,
    required super.phone,
    required super.jobStatus,
    required super.endIn,
    required super.endJobReason,
  });

  factory AllEmpModel.fromJson(Map<String, dynamic> json) {
    return AllEmpModel(
      id: json['id'],
      name: json['name'],
      position: json['position']['position'],
      image: json['image'],
      phone: json['phone'],
      jobStatus: json['job_status'],
      endIn: json['end_in'],
      endJobReason: json['end_job_reason'],
    );
  }
}
