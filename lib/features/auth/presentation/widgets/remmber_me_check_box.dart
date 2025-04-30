import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';

import '../../../../core/language/lang_keys.dart';
import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';

class RemmberCheckBox extends StatefulWidget {
  const RemmberCheckBox({super.key});

  @override
  State<RemmberCheckBox> createState() => _RemmberCheckBoxState();
}

class _RemmberCheckBoxState extends State<RemmberCheckBox> {
  @override
  Widget build(BuildContext context) {
    var isRemember = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 10,
        children: [
          Checkbox(
            value: isRemember.remmeberMe,
            activeColor: AppColors.green,
            shape: const CircleBorder(),
            checkColor: AppColors.white,
            onChanged: (v) {
              setState(() {
                isRemember.remmeberMe = v!;
              });
            },
          ),
          AppText(LangKeys.remeberMe),
        ],
      ),
    );
  }
}
