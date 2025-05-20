part of 'get_month_cubit.dart';

sealed class GetMonthState extends Equatable {
  const GetMonthState();

  @override
  List<Object> get props => [];
}

final class GetMonthInitial extends GetMonthState {}

final class GetMonthLoading extends GetMonthState {}

final class GetMonthLoaded extends GetMonthState {
  final List<String> monthList;
  const GetMonthLoaded(this.monthList);
}

final class GetMonthError extends GetMonthState {
  final String message;
  const GetMonthError(this.message);
}
