part of 'check_user_custody_cubit.dart';

sealed class CheckUserCustodyState extends Equatable {
  const CheckUserCustodyState();

  @override
  List<Object> get props => [];
}

final class CheckUserCustodyInitial extends CheckUserCustodyState {}

final class CheckUserCustodyLoading extends CheckUserCustodyState {}

final class CheckUserCustodyError extends CheckUserCustodyState {
  final String message;
  const CheckUserCustodyError(this.message);
}

final class CheckUserCustodyLoaded extends CheckUserCustodyState {
  final List<CheckUserCustodyModel> isCustody;
  const CheckUserCustodyLoaded(this.isCustody);
}
