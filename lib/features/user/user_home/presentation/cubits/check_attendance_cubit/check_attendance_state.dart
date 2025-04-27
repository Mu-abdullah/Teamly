part of 'check_attendance_cubit.dart';

sealed class CheckAttendanceState extends Equatable {
  const CheckAttendanceState();

  @override
  List<Object> get props => [];
}

final class CheckAttendanceInitial extends CheckAttendanceState {}

final class CheckAttendanceLoading extends CheckAttendanceState {}

final class CheckAttendanceError extends CheckAttendanceState {
  final String message;
  const CheckAttendanceError(this.message);
  @override
  List<Object> get props => [message];
}

final class CheckAttendanceLoaded extends CheckAttendanceState {
  final CheckAttendanceModel model;
  const CheckAttendanceLoaded(this.model);
  @override
  List<Object> get props => [model];
}
