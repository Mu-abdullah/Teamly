import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_werehouse_model.dart';
import '../../../data/repo/get_werehouse_items_repo.dart';

part 'warehouse_state.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  final GetWerehouseItemsRepo repo;
  WarehouseCubit(this.repo) : super(WarehouseInitial());

  static WarehouseCubit get(context) => BlocProvider.of(context);

  List<GetWarehouseModel> items = [];
  String? selectedCategory;
  Future<void> getWerehouseItems({required String compId}) async {
    emit(WarehouseLoading());
    final res = await repo.getWerehouseItems(compId: compId);
    res.fold(
      (l) {
        if (!isClosed) {
          emit(WarehouseError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          items = r;
          emit(WarehouseLoaded(r));
        }
      },
    );
  }

  void filterByCategory(String category) {
    if (category == selectedCategory) {
      selectedCategory = null;
      emit(WarehouseLoaded(List.from(items)));
    } else {
      selectedCategory = category;
      final filteredProducts =
          items.where((product) => product.category == category).toList();
      emit(WarehouseLoaded(filteredProducts));
    }
  }
}
