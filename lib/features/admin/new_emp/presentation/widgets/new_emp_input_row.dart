
import 'package:flutter/material.dart';

import '../../../../../core/style/widgets/app_text_form_felid.dart';

class NewEmpInputRow extends StatelessWidget {
  const NewEmpInputRow({
    super.key,
    required this.lable,
    required this.controller,
    required this.icon,
    required this.validate,
    this.type = TextInputType.text,
    this.onTap,
    this.maxLength,
  });

  final String lable;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;
  final String? Function(String?) validate;
  final Function()? onTap;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon),
        Expanded(
          flex: 3,
          child: AppTextFormField(
            label: lable,
            controller: controller,
            type: type,
            validate: validate,
            onTap: onTap,
            maxLength: maxLength,
          ),
        ),
      ],
    );
  }
}
