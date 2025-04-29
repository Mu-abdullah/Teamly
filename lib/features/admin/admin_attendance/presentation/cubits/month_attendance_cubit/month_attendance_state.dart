part of 'month_attendance_cubit.dart';

sealed class MonthAttendanceState extends Equatable {
  const MonthAttendanceState();

  @override
  List<Object> get props => [];
}

final class MonthAttendanceInitial extends MonthAttendanceState {}

final class MonthAttendanceLoading extends MonthAttendanceState {}

final class MonthAttendanceLoaded extends MonthAttendanceState {
  final List<MonthAdminAttendance> attendanceList;

  const MonthAttendanceLoaded(this.attendanceList);
}

final class MonthAttendanceError extends MonthAttendanceState {
  final String message;

  const MonthAttendanceError(this.message);
}
