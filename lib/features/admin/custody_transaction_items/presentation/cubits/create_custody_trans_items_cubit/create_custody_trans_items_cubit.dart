import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/create_custody_trans_item_model.dart';
import '../../../data/repo/create_custody_trans_item_repo.dart';

part 'create_custody_trans_items_state.dart';

class CreateCustodyTransItemsCubit extends Cubit<CreateCustodyTransItemsState> {
  CreateCustodyTransItemRepo repo;
  CreateCustodyTransItemsCubit(this.repo)
    : super(CreateCustodyTransItemsInitial());
  static CreateCustodyTransItemsCubit get(context) => BlocProvider.of(context);

  Future<void> addItems(List<CreateCustodyTransItemModel> items) async {
    for (int i = 0; i < items.length; i++) {
      await addItem(model: items[i]);
    }
  }

  Future<void> addItem({required CreateCustodyTransItemModel model}) async {
    emit(CreateCustodyTransItemsLoading());
    var re = await repo.createCustodyTransItem(model: model);
    re.fold(
      (l) {
        if (!isClosed) {
          emit(CreateCustodyTransItemsError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(CreateCustodyTransItemsLoaded(r));
        }
      },
    );
  }
}
