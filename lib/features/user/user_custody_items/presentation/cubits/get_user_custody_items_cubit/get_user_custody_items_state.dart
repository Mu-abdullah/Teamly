part of 'get_user_custody_items_cubit.dart';

sealed class GetUserCustodyItemsState extends Equatable {
  const GetUserCustodyItemsState();

  @override
  List<Object> get props => [];
}

final class GetUserCustodyItemsInitial extends GetUserCustodyItemsState {}

final class GetUserCustodyItemsLoading extends GetUserCustodyItemsState {}

final class GetUserCustodyItemsLoaded extends GetUserCustodyItemsState {
  final List<UserGetCustodyItemModel> items;
  const GetUserCustodyItemsLoaded(this.items);
}

final class GetUserCustodyItemsError extends GetUserCustodyItemsState {
  final String message;
  const GetUserCustodyItemsError(this.message);
}
