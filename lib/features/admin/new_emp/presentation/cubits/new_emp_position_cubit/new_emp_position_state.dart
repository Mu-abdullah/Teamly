part of 'new_emp_position_cubit.dart';

sealed class NewEmpPositionState extends Equatable {
  const NewEmpPositionState();

  @override
  List<Object> get props => [];
}

final class NewEmpPositionInitial extends NewEmpPositionState {}

final class NewEmpPositionLoading extends NewEmpPositionState {}

final class NewEmpPositionLoaded extends NewEmpPositionState {
  final List<NewEmpPositionsModel> positions;

  const NewEmpPositionLoaded(this.positions);
}

final class NewEmpPositionError extends NewEmpPositionState {
  final String message;

  const NewEmpPositionError(this.message);
}

final class GenderLoading extends NewEmpPositionState {}

final class GenderLoaded extends NewEmpPositionState {
  final List<GenderModel> genders;

  const GenderLoaded(this.genders);
}

final class GenderError extends NewEmpPositionState {
  final String message;

  const GenderError(this.message);
}