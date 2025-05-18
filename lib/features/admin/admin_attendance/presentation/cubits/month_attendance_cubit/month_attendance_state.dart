part of 'month_attendance_cubit.dart';

sealed class MonthAttendanceState extends Equatable {
  const MonthAttendanceState();

  @override
  List<Object> get props => [];
}

final class MonthAttendanceInitial extends MonthAttendanceState {}

class MonthAttendanceLoading extends MonthAttendanceState {}

class MonthAttendanceLoaded extends MonthAttendanceState {
  final MonthlyReport report;

  const MonthAttendanceLoaded(this.report);

  @override
  List<Object> get props => [report];
}

class MonthAttendanceError extends MonthAttendanceState {
  final String message;

  const MonthAttendanceError(this.message);

  @override
  List<Object> get props => [message];
}
