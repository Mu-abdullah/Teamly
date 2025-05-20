part of 'new_emp_form_cubit.dart';

sealed class NewEmpFormState extends Equatable {
  const NewEmpFormState();

  @override
  List<Object> get props => [];
}

final class NewEmpInitial extends NewEmpFormState {}

final class GetImageFromGallery extends NewEmpFormState {}

final class ErrorImageFromGallery extends NewEmpFormState {
  final String error;
  const ErrorImageFromGallery({required this.error});
}

final class NewEmpLoading extends NewEmpFormState {}

final class NewEmpSubmitted extends NewEmpFormState {
  final EmpModel emp;
  const NewEmpSubmitted({required this.emp});
}

final class NewEmpError extends NewEmpFormState {
  final String error;
  const NewEmpError(this.error);
}
