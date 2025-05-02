part of 'request_vacation_cubit.dart';

sealed class RequestVacationState extends Equatable {
  const RequestVacationState();

  @override
  List<Object> get props => [];
}

final class RequestVacationInitial extends RequestVacationState {}

final class VactionType extends RequestVacationState {
  final String value;
  const VactionType(this.value);
}

final class VactionReason extends RequestVacationState {
  final String value;
  const VactionReason(this.value);
}

final class RequestVacationLoading extends RequestVacationState {}

final class RequestVacationSuccess extends RequestVacationState {}

final class RequestVacationError extends RequestVacationState {
  final String message;
  const RequestVacationError(this.message);
}
