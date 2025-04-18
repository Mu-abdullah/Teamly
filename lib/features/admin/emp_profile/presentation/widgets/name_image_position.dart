import 'package:flutter/material.dart';

import '../../../../../core/style/statics/image_test.dart';
import '../../../../../core/style/widgets/app_text.dart';

class NameImagePosition extends StatelessWidget {
  const NameImagePosition({super.key});

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

          AppText('محمد علي', isTitle: true, translate: false),
          AppText(
            'مهندس البرمجيات',
            textAlign: TextAlign.center,
            translate: false,
            isTitle: true,
          ),
        ],
      ),
    );
  }
}
