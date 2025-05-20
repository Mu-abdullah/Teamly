part of 'settled_custody_cubit.dart';

sealed class SettledCustodyState extends Equatable {
  const SettledCustodyState();

  @override
  List<Object> get props => [];
}

final class SettledCustodyInitial extends SettledCustodyState {}

final class SettledCustodyLoading extends SettledCustodyState {}

final class SettledCustodySuccess extends SettledCustodyState {
  final UpdateCustodyStatusModel message;
  const SettledCustodySuccess(this.message);
}

final class SettledCustodyError extends SettledCustodyState {
  final String message;
  const SettledCustodyError(this.message);
}