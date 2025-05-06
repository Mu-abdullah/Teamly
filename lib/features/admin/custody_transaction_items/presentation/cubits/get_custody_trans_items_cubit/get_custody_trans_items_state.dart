part of 'get_custody_trans_items_cubit.dart';

sealed class GetCustodyTransItemsState extends Equatable {
  const GetCustodyTransItemsState();

  @override
  List<Object> get props => [];
}

final class GetCustodyTransItemsInitial extends GetCustodyTransItemsState {}

final class GetCustodyTransItemsLoading extends GetCustodyTransItemsState {}

final class GetCustodyTransItemsLoaded extends GetCustodyTransItemsState {
  final List<GetCustodyTransItemModel> items;
  const GetCustodyTransItemsLoaded(this.items);
}

final class GetCustodyTransItemsError extends GetCustodyTransItemsState {
  final String error;
  const GetCustodyTransItemsError(this.error);
}
