part of 'new_request_vacation_cubit.dart';

sealed class NewRequestVacationState extends Equatable {
  const NewRequestVacationState();

  @override
  List<Object> get props => [];
}

final class RequestVacationInitial extends NewRequestVacationState {}

final class VactionType extends NewRequestVacationState {
  final String value;
  const VactionType(this.value);
}

final class VactionReason extends NewRequestVacationState {
  final String value;
  const VactionReason(this.value);
}

final class RequestVacationLoading extends NewRequestVacationState {}

final class RequestVacationSuccess extends NewRequestVacationState {}

final class RequestVacationError extends NewRequestVacationState {
  final String message;
  const RequestVacationError(this.message);
}
