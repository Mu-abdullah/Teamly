part of 'exit_quantity_cubit.dart';

sealed class ExitQuantityState extends Equatable {
  const ExitQuantityState();

  @override
  List<Object> get props => [];
}

final class ExitQuantityInitial extends ExitQuantityState {}

final class ExitQuantityLoading extends ExitQuantityState {}

final class ExitQuantityLoaded extends ExitQuantityState {
  final ExistItemModel model;
  const ExitQuantityLoaded(this.model);
}

final class ExitQuantityError extends ExitQuantityState {
  final String message;
  const ExitQuantityError(this.message);
}

