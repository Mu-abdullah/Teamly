part of 'check_role_cubit.dart';

sealed class CheckRoleState extends Equatable {
  const CheckRoleState();

  @override
  List<Object> get props => [];
}

final class CheckRoleInitial extends CheckRoleState {}

final class CheckRoleLoading extends CheckRoleState {}

final class CheckRoleLoaded extends CheckRoleState {
  final UserModel role;
  const CheckRoleLoaded(this.role);

  @override
  List<Object> get props => [role];
}

final class CheckRoleError extends CheckRoleState {
  final String message;
  const CheckRoleError(this.message);

  @override
  List<Object> get props => [message];
}


final class UserDataLoaded extends CheckRoleState {
  final EmpModel user;
  const UserDataLoaded(this.user);

  @override
  List<Object> get props => [user];
}
final class UserDataError extends CheckRoleState {
  final String message;
  const UserDataError(this.message);

  @override
  List<Object> get props => [message];
}
final class UserDataLoading extends CheckRoleState {}