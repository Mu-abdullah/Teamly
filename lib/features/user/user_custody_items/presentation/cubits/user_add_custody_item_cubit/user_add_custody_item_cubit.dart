import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/user_add_custody_item_repo.dart';

part 'user_add_custody_item_state.dart';

class UserAddCustodyItemCubit extends Cubit<UserAddCustodyItemState> {
  UserAddCustodyItemRepo repo;
  UserAddCustodyItemCubit(this.repo) : super(UserAddCustodyItemInitial());
}
