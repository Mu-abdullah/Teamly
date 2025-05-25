import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/warehouse_categoties_model.dart';
import '../../../data/repo/get_warehouse_categoties_repo.dart';

part 'get_w_categories_state.dart';

class GetWCategoriesCubit extends Cubit<GetWCategoriesState> {
  GetWarehouseCategotiesRepo repo;
  GetWCategoriesCubit(this.repo) : super(GetWCategoriesInitial());

  static GetWCategoriesCubit get(context) => BlocProvider.of(context);

  Future<void> getWarehouseCategories(String comp) async {
    emit(GetWCategoriesLoading());
    final result = await repo.getWarehouseCategories(comp);
    result.fold(
      (error) {
        if (!isClosed) {
          emit(GetWCategoriesError(error.message));
        }
      },
      (categories) {
        if (categories.isEmpty) {
          emit(GetWCategoriesEmpty('No categories found'));
        } else {
          emit(GetWCategoriesLoaded(categories));
        }
      },
    );
  }
}
