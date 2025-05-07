import 'package:flutter/material.dart';
import '../../../core/style/widgets/app_text.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomSnackbar {
  static void showTopSnackBar(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
    bool needIcon = false,
    bool translate = true,
    bool top = true,
    IconData icon = HugeIcons.strokeRoundedCheckmarkCircle01,
  }) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: top ? MediaQuery.of(context).padding.top + 10 : null,
            left: 20,
            right: 20,
            bottom: !top ? MediaQuery.of(context).padding.bottom + 10 : null,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: AppText(
                        message,
                        color: textColor,
                        maxLines: 5,
                        translate: translate,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    needIcon == false
                        ? const SizedBox()
                        : Icon(icon, color: textColor),
                  ],
                ),
              ),
            ),
          ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 2), () => entry.remove());
  }
}
