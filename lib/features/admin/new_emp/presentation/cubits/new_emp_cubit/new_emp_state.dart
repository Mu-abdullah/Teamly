part of 'new_emp_cubit.dart';

sealed class NewEmpState extends Equatable {
  const NewEmpState();

  @override
  List<Object> get props => [];
}

final class NewEmpInitial extends NewEmpState {}

final class GetImageFromGallery extends NewEmpState {}

final class ErrorImageFromGallery extends NewEmpState {
  final String error;
  const ErrorImageFromGallery({required this.error});
}