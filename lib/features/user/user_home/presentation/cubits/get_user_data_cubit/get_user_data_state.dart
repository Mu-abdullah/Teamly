part of 'get_user_data_cubit.dart';

sealed class GetUserDataState extends Equatable {
  const GetUserDataState();

  @override
  List<Object> get props => [];
}

final class GetUserDataInitial extends GetUserDataState {}

final class GetUserDataLoading extends GetUserDataState {}

final class GetUserDataLoaded extends GetUserDataState {
  final UserHomeModel user;
  const GetUserDataLoaded(this.user);
}

final class GetUserDataError extends GetUserDataState {
  final String message;
  const GetUserDataError(this.message);
}