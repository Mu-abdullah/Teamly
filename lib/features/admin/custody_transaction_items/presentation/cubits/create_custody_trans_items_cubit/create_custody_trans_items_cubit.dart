import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_custody_trans_items_state.dart';

class CreateCustodyTransItemsCubit extends Cubit<CreateCustodyTransItemsState> {
  CreateCustodyTransItemsCubit() : super(CreateCustodyTransItemsInitial());
}
