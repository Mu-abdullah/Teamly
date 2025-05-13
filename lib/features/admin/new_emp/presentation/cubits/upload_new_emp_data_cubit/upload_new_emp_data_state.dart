part of 'upload_new_emp_data_cubit.dart';

sealed class UploadNewEmpDataState extends Equatable {
  const UploadNewEmpDataState();

  @override
  List<Object> get props => [];
}

final class UploadNewEmpDataInitial extends UploadNewEmpDataState {}

final class EmpUploading extends UploadNewEmpDataState {}

final class EmpUploaded extends UploadNewEmpDataState {
  final EmpModel emp;
  const EmpUploaded({required this.emp});
  @override
  List<Object> get props => [emp];
}

final class EmpUploadError extends UploadNewEmpDataState {
  final String message;
  const EmpUploadError(this.message);
  @override
  List<Object> get props => [message];
}
