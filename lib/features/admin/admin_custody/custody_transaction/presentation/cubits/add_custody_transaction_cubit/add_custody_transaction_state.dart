part of 'add_custody_transaction_cubit.dart';

sealed class AddCustodyTransactionState extends Equatable {
  const AddCustodyTransactionState();

  @override
  List<Object> get props => [];
}

final class AddCustodyTransactionInitial extends AddCustodyTransactionState {}

final class AddCustodyTransactionLoading extends AddCustodyTransactionState {}

final class AddCustodyTransactionLoaded extends AddCustodyTransactionState {}

final class AddCustodyTransactionError extends AddCustodyTransactionState {
  final String message;
  const AddCustodyTransactionError(this.message);
}
