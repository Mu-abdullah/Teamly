part of 'user_check_vacation_cubit.dart';

sealed class UserCheckVacationState extends Equatable {
  const UserCheckVacationState();

  @override
  List<Object> get props => [];
}

final class UserCheckVacationInitial extends UserCheckVacationState {}

final class UserCheckVacationLoading extends UserCheckVacationState {}

final class UserCheckVacationLoaded extends UserCheckVacationState {
  final List<UserCheckVacationModel> requests;
  const UserCheckVacationLoaded(this.requests);
}

final class UserCheckVacationError extends UserCheckVacationState {
  final String error;
  const UserCheckVacationError(this.error);
}
