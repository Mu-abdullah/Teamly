import '../../../../../core/entities/emp_entity.dart';

class EmpCountModel extends EmpEntity {
  EmpCountModel({required super.name, required super.jobStatus});
  factory EmpCountModel.fromJson(Map<String, dynamic> json) {
    return EmpCountModel(
      name: json['name'] as String?,
      jobStatus: json['job_status'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'job_status': jobStatus};
  }
}
