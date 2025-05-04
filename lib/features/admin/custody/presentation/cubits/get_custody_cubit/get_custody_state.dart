part of 'get_custody_cubit.dart';

sealed class GetCustodyState extends Equatable {
  const GetCustodyState();

  @override
  List<Object> get props => [];
}

final class GetCustodyInitial extends GetCustodyState {}

class CustodyLoading extends GetCustodyState {}

class CustodyLoaded extends GetCustodyState {
  final List<CustodyModel> custody;

  const CustodyLoaded(this.custody);
}

class CustodyError extends GetCustodyState {
  final CustomError error;

  const CustodyError(this.error);
}

class BottomSheetOpened extends GetCustodyState {
  final List<CustodyModel> custody;

  const BottomSheetOpened(this.custody);
}

class AddCustodyLoading extends GetCustodyState {}

class AddCustodySuccess extends GetCustodyState {}

class AddCustodyError extends GetCustodyState {
  final String error;

  const AddCustodyError(this.error);
}