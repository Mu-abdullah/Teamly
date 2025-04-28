part of 'attendance_history_cubit.dart';

sealed class AttendanceHistoryState extends Equatable {
  const AttendanceHistoryState();

  @override
  List<Object> get props => [];
}

final class AttendanceHistoryInitial extends AttendanceHistoryState {}

final class HistoryLoading extends AttendanceHistoryState {}

final class HistoryLoaded extends AttendanceHistoryState {
  final List<HistoryAttendanceModel> history;
  const HistoryLoaded(this.history);
}

final class HistoryLoadError extends AttendanceHistoryState {
  final String error;
  const HistoryLoadError(this.error);
}
