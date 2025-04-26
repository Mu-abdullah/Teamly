import 'package:flutter/material.dart';

import '../../../../../core/style/statics/image_test.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../auth/data/models/emp_model.dart';

class NameImagePosition extends StatelessWidget {
  const NameImagePosition({super.key, required this.user});
  final EmpModel user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        spacing: 8,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(ImageTest.bloger),
                fit: BoxFit.cover,
              ),
            ),
          ),

          AppText(user.name!, isTitle: true, translate: false),
          AppText(
            user.position!,
            textAlign: TextAlign.center,
            translate: false,
            isTitle: true,
          ),
        ],
      ),
    );
  }
}
