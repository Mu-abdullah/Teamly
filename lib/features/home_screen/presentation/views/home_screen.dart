import 'package:flutter/material.dart';
import 'package:teamly/core/services/supabase/supabase_init.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/services/dio/dio_service.dart';
import '../../../../core/style/widgets/app_button.dart';
import '../../../../core/style/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(translatedTitle: LangKeys.home, isBack: false),
      body: Column(
        children: [
          // Center(child: AppText(context.translate(LangKeys.home))),
          AppButton(
            onTap: () {
              DioService(
                apiKey: SupabaseInit.supabaseAnonKey,
                graphqlUrl: "${SupabaseInit.supabaseUrl}/graphql/v1",
              ).fetchData();
            },
            text: LangKeys.done,
          ),
        ],
      ),
    );
  }
}
