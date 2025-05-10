import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../user_custody/data/model/user_custody_model.dart';
import '../../data/repo/user_get_custody_item_repo.dart';
import '../cubits/get_user_custody_items_cubit/get_user_custody_items_cubit.dart';
import '../refactor/user_custody_item_screen_body.dart';
import '../widgets/user_add_custody_item.dart';
import '../widgets/user_custody_appbar_status.dart';

class UserCustodyItemsScreen extends StatelessWidget {
  const UserCustodyItemsScreen({super.key, required this.item});
  final UserCustodyModel item;
  @override
  Widget build(BuildContext context) {
    final lac = locator<UserGetCustodyItemRepo>();
    return BlocProvider(
      create:
          (context) =>
              GetUserCustodyItemsCubit(lac, item: item)..getItems(item.id!),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LangKeys.custodyDetails,
          actions: [
            UserCustodyAppBarStatus(status: item.status!),
            if (item.status != CustodyStatus.settled)
              UserAddCustodyItem(item: item),
          ],
        ),
        body: UserCustodyItemsScreenBody(),
      ),
    );
  }
}
