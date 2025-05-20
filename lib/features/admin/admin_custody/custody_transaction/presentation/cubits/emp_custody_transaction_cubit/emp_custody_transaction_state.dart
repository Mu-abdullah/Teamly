part of 'emp_custody_transaction_cubit.dart';

sealed class EmpCustodyTransactionState extends Equatable {
  const EmpCustodyTransactionState();

  @override
  List<Object> get props => [];
}

final class AddCustodyTransactionInitial extends EmpCustodyTransactionState {}

final class GetEmpLoading extends EmpCustodyTransactionState {}

final class GetEmpLoaded extends EmpCustodyTransactionState {
  final List<CustodyEmpModel> empList;
  const GetEmpLoaded(this.empList);
}

final class GetEmpError extends EmpCustodyTransactionState {
  final String message;
  const GetEmpError(this.message);
}
