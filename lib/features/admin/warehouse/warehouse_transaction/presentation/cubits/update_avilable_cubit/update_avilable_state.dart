part of 'update_avilable_cubit.dart';

sealed class UpdateAvilableState extends Equatable {
  const UpdateAvilableState();

  @override
  List<Object> get props => [];
}

final class UpdateAvilableInitial extends UpdateAvilableState {}

final class UpdateItemLoading extends UpdateAvilableState {}

final class UpdateItemLoaded extends UpdateAvilableState {
  final bool isUpdated;
  const UpdateItemLoaded(this.isUpdated);
}

final class UpdateItemError extends UpdateAvilableState {
  final String message;
  const UpdateItemError(this.message);
}
