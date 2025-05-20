part of 'export_report_cubit.dart';

sealed class ExportReportState extends Equatable {
  const ExportReportState();

  @override
  List<Object> get props => [];
}

final class ExportReportInitial extends ExportReportState {}

final class ExportReportLoading extends ExportReportState {}

final class ExportReportSuccess extends ExportReportState {}

final class ExportReportError extends ExportReportState {
  final String message;
  const ExportReportError(this.message);
}
