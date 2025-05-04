part of 'vacation_response_cubit.dart';

sealed class VacationResponseState extends Equatable {
  const VacationResponseState();

  @override
  List<Object> get props => [];
}

final class VacationResponseInitial extends VacationResponseState {}

final class VacationResponseSuccess extends VacationResponseState {
  final List<VacationResponseModel> responses;
  const VacationResponseSuccess(this.responses);
}

final class VacationResponseLoading extends VacationResponseState {}

final class VacationResponseError extends VacationResponseState {
  final String message;
  const VacationResponseError(this.message);
}