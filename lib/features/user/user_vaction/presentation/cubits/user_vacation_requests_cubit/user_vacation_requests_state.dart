part of 'user_vacation_requests_cubit.dart';

sealed class UserVacationRequestsState extends Equatable {
  const UserVacationRequestsState();

  @override
  List<Object> get props => [];
}

final class UservacationRequestsInitial extends UserVacationRequestsState {}

final class UservacationRequestsLoading extends UserVacationRequestsState {}

final class UservacationRequestsLoadedState extends UserVacationRequestsState {
  final List<UserRequestsVacations> requests;
  const UservacationRequestsLoadedState(this.requests);
}

final class UservacationRequestsErrorState extends UserVacationRequestsState {
  final String error;
  const UservacationRequestsErrorState(this.error);
}
