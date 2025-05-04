import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../../data/model/custody_model.dart';
import '../../../data/repo/add_custody.dart';
import '../../../data/repo/get_custody.dart';

part 'get_custody_state.dart';

class GetCustodyCubit extends Cubit<GetCustodyState> {
  final GetCustodyRepo custodyRepo;
  final AddCustodyRepo repo;
  GetCustodyCubit(this.custodyRepo, this.repo) : super(GetCustodyInitial());

  static GetCustodyCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var amountController = TextEditingController();
  List<CustodyModel>? custody;
  Future<void> insertCustody({
    required CustodyModel data,
    required BuildContext context,
    required String compId,
  }) async {
    emit(AddCustodyLoading());
    var res = await repo.insertCustody(data: data.toJson());
    res.fold(
      (l) {
        if (!isClosed) {
          emit(AddCustodyError(l.message));
          debugPrint("Error: ${l.message}");
        }
      },
      (r) {
        if (!isClosed) {
          emit(AddCustodySuccess());
          fetchCustody(compId);
        }
      },
    );
  }

  Future<void> fetchCustody(String compId) async {
    emit(CustodyLoading());

    final result = await custodyRepo.getCustody(compId);

    result.fold(
      (error) {
        emit(CustodyError(error));
        debugPrint(error.toString());
      },
      (transactions) {
        if (!isClosed) {
          transactions.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
          custody = transactions;

          emit(CustodyLoaded(transactions));
        }
      },
    );
  }

  void openBottomSheet({
    required BuildContext context,
    required Widget widget,
  }) {
    customShowBottomSheet(
      context: context,
      isScrollControlled: true,

      builder: (context) {
        return widget;
      },
    );
    emit(BottomSheetOpened(custody!));
  }
}
