import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../user_custody/presentation/widgets/custody_loading_shimmer.dart';
import '../cubits/get_user_custody_items_cubit/get_user_custody_items_cubit.dart';
import '../widgets/user_custody_listview.dart';

class UserCustodyItemsScreenBody extends StatelessWidget {
  const UserCustodyItemsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCustodyItemsCubit, GetUserCustodyItemsState>(
      builder: (context, state) {
        if (state is GetUserCustodyItemsLoading) {
          return LoadingShimmer();
        } else if (state is GetUserCustodyItemsLoaded) {
          if (state.items.isEmpty) {
            return Center(child: AppText(LangKeys.noDataFound));
          } else {
            return UserCustodyItemListview(items: state.items);
          }
        } else if (state is GetUserCustodyItemsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
