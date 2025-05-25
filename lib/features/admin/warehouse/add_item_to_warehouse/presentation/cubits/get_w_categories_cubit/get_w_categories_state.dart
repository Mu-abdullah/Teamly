part of 'get_w_categories_cubit.dart';

sealed class GetWCategoriesState extends Equatable {
  const GetWCategoriesState();

  @override
  List<Object> get props => [];
}

final class GetWCategoriesInitial extends GetWCategoriesState {}

final class GetWCategoriesLoading extends GetWCategoriesState {}

final class GetWCategoriesLoaded extends GetWCategoriesState {
  final List<WarehouseCategotiesModel> categories;

  const GetWCategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

final class GetWCategoriesError extends GetWCategoriesState {
  final String error;

  const GetWCategoriesError(this.error);

  @override
  List<Object> get props => [error];
}

final class GetWCategoriesEmpty extends GetWCategoriesState {
  final String message;

  const GetWCategoriesEmpty(this.message);

  @override
  List<Object> get props => [message];
}
