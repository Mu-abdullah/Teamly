part of 'get_custody_transaction_cubit.dart';

sealed class GetCustodyTransactionState extends Equatable {
  const GetCustodyTransactionState();

  @override
  List<Object> get props => [];
}

final class GetCustodyTransactionInitial extends GetCustodyTransactionState {}

final class GetCustodyTransactionLoading extends GetCustodyTransactionState {}

final class GetCustodyTransactionLoaded extends GetCustodyTransactionState {
  final List<CustodyTransactionModel> custodyTransaction;

  const GetCustodyTransactionLoaded(this.custodyTransaction);
}

final class GetCustodyTransactionError extends GetCustodyTransactionState {
  final CustomError error;

  const GetCustodyTransactionError(this.error);
}
