part of 'attendance_cubit.dart';

sealed class AttendanceState extends Equatable {
  const AttendanceState();

  @override
  List<Object> get props => [];
}

final class AttendanceInitial extends AttendanceState {}

final class AttendanceLoading extends AttendanceState {}

final class AttendanceLoaded extends AttendanceState {
  final AttendanceModel attendanceModel;
  const AttendanceLoaded(this.attendanceModel);

  @override
  List<Object> get props => [attendanceModel];
}

final class AttendanceError extends AttendanceState {
  final String message;
  const AttendanceError(this.message);
}
