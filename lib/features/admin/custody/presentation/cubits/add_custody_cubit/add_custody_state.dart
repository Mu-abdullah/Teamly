part of 'add_custody_cubit.dart';

sealed class AddCustodyState extends Equatable {
  const AddCustodyState();

  @override
  List<Object> get props => [];
}

final class AddCustodyInitial extends AddCustodyState {}

final class AddCustodyLoadingState extends AddCustodyState {}
final class AddCustodySuccessState extends AddCustodyState {}
final class AddCustodyErrorState extends AddCustodyState {
  final String error;

  const AddCustodyErrorState(this.error);

  @override
  List<Object> get props => [error];
}