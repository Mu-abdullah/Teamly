part of 'create_custody_trans_items_cubit.dart';

sealed class CreateCustodyTransItemsState extends Equatable {
  const CreateCustodyTransItemsState();

  @override
  List<Object> get props => [];
}

final class CreateCustodyTransItemsInitial
    extends CreateCustodyTransItemsState {}

final class CreateCustodyTransItemsLoading
    extends CreateCustodyTransItemsState {}

final class CreateCustodyTransItemsLoaded extends CreateCustodyTransItemsState {
  final CreateCustodyTransItemModel items;
  const CreateCustodyTransItemsLoaded(this.items);
}

final class CreateCustodyTransItemsError extends CreateCustodyTransItemsState {
  final String message;
  const CreateCustodyTransItemsError(this.message);
}
