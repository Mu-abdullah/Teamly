part of 'user_custody_cubit.dart';

sealed class UserCustodyState extends Equatable {
  const UserCustodyState();

  @override
  List<Object> get props => [];
}

final class UserCustodyInitial extends UserCustodyState {}

final class UserCustodyLoading extends UserCustodyState {}

final class UserCustodyLoaded extends UserCustodyState {
  final List<UserCustodyModel> userCustodyList;
  const UserCustodyLoaded(this.userCustodyList);
}

final class UserCustodyError extends UserCustodyState {
  final String message;
  const UserCustodyError(this.message);
}
