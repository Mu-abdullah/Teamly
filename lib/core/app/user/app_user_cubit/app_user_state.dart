part of 'app_user_cubit.dart';

sealed class AppUserState extends Equatable {
  const AppUserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends AppUserState {}

// final class UserLoading extends AppUserState {}

// final class UserLoggedIn extends AppUserState {
//   final UserModel user;
//   const UserLoggedIn({required this.user});
// }

// final class UserNotLoggedIn extends AppUserState {}

// final class UserError extends AppUserState {
//   final String message;
//   const UserError({required this.message});
// }

// final class SavedUser extends AppUserState {
//   final UserModel user;
//   const SavedUser({required this.user});
// }
