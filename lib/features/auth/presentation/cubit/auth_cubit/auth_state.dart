part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthResponse authResponse;

  const AuthSuccess(this.authResponse);

  @override
  List<Object> get props => [authResponse];
}

final class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

final class UserNotFound extends AuthState {
  final String message;

  const UserNotFound(this.message);

  @override
  List<Object> get props => [message];
}

class ChangeRememberMe extends AuthState {}
