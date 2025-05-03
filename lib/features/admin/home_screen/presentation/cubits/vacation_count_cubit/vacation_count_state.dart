part of 'vacation_count_cubit.dart';

sealed class VacationCountState extends Equatable {
  const VacationCountState();

  @override
  List<Object> get props => [];
}

final class VacationCountInitial extends VacationCountState {}

final class VacationCountLoading extends VacationCountState {}

final class VacationCountSuccess extends VacationCountState {
  final List<VacationCount> vacCount;
  const VacationCountSuccess(this.vacCount);
}

final class VacationCountError extends VacationCountState {
  final String message;
  const VacationCountError(this.message);
}
