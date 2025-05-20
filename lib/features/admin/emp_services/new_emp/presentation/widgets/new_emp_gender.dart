import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/status/gender_status.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../cubits/new_emp_form_cubit/new_emp_form_cubit.dart';

class NewEmpGender extends StatefulWidget {
  const NewEmpGender({super.key, required this.cubit});
  final NewEmpFormCubit cubit;
  @override
  State<NewEmpGender> createState() => _NewEmpGenderState();
}

class _NewEmpGenderState extends State<NewEmpGender> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(HugeIcons.strokeRoundedMan, color: AppColors.blueAccent),
        Expanded(
          child: RadioListTile<Gender>(
            title: AppText(LangKeys.male),
            value: Gender.male,
            groupValue: selectedGender,
            activeColor: AppColors.blueAccent,
            onChanged: (Gender? value) {
              setState(() {
                selectedGender = value;
                widget.cubit.gender = GenderStatus.getGender(Gender.male);
              });
            },
          ),
        ),
        SizedBox(height: 50, child: VerticalDivider(color: Colors.grey)),
        Icon(HugeIcons.strokeRoundedWoman, color: AppColors.pink),
        Expanded(
          child: RadioListTile<Gender>(
            title: AppText(LangKeys.female),
            value: Gender.female,
            activeColor: AppColors.pink,
            groupValue: selectedGender,
            onChanged: (Gender? value) {
              setState(() {
                selectedGender = value;
                widget.cubit.gender = GenderStatus.getGender(Gender.female);
              });
            },
          ),
        ),
      ],
    );
  }
}
