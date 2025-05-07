import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/create_custody_trans_item_repo.dart';

part 'create_custody_trans_items_state.dart';

class CreateCustodyTransItemsCubit extends Cubit<CreateCustodyTransItemsState> {
  CreateCustodyTransItemRepo repo;
  CreateCustodyTransItemsCubit(this.repo)
    : super(CreateCustodyTransItemsInitial());
  static CreateCustodyTransItemsCubit get(context) => BlocProvider.of(context);
  
}
