part of 'settaled_user_custody_cubit.dart';

sealed class SettaledUserCustodyState extends Equatable {
  const SettaledUserCustodyState();

  @override
  List<Object> get props => [];
}

final class SettaledUserCustodyInitial extends SettaledUserCustodyState {}

final class SettaledUserCustodyLoading extends SettaledUserCustodyState {}

final class SettaledUserCustodySuccess extends SettaledUserCustodyState {
  final SatteldUserCustodyModel userCustodyModel;
  const SettaledUserCustodySuccess(this.userCustodyModel);
}

final class SettaledUserCustodyError extends SettaledUserCustodyState {
  final String message;
  const SettaledUserCustodyError(this.message);
}