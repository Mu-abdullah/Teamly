import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import 'decoration_container.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedContainer(
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: AppText(LangKeys.itemCount, fontSize: 11),
            ),
            const Expanded(
              flex: 4,
              child: AppText(LangKeys.itemName, maxLines: 4),
            ),
            AppText(LangKeys.itemPrice),
          ],
        ),
      ),
    );
  }
}
