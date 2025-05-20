import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../cubits/get_custody_cubit/get_custody_cubit.dart';
import '../widgets/custody/custody_listview.dart';

class MobileCustodyBody extends StatelessWidget {
  const MobileCustodyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCustodyCubit, GetCustodyState>(
      listener: (context, state) {
        if (state is AddCustodySuccess) {
          Navigator.pop(context);
          CustomSnackbar.showTopSnackBar(
            context,
            message: LangKeys.addedSuccess,
          );
        } else if (state is AddCustodyError) {
          CustomSnackbar.showTopSnackBar(
            context,
            message: state.error,
            translate: false,
          );
        }
      },
      builder: (context, state) {
        return _buildBodyContent(context, state);
      },
    );
  }

  Widget _buildBodyContent(BuildContext context, GetCustodyState state) {
    if (state is CustodyLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CustodyLoaded) {
      return state.custody.isEmpty
          ? const Center(child: AppText(LangKeys.noDataFound))
          : CustodyListView(custodyList: state.custody);
    } else if (state is CustodyError) {
      return Center(child: AppText(state.error.message));
    } else if (state is BottomSheetOpened) {
      return state.custody.isEmpty
          ? const Center(child: AppText(LangKeys.noDataFound))
          : CustodyListView(custodyList: state.custody);
    }
    return const Center(child: AppText(LangKeys.noDataFound));
  }
}
