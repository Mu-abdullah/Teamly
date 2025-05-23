import 'package:flutter/material.dart';

import 'info_icon.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({super.key, required this.item});

  final InfoItem item;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          item.onTap != null
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: item.onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: item.color.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: item.color.withValues(alpha: 0.2), width: 1),
          ),
          child: Row(
            children: [
              InfoIcon(icon: item.icon, color: item.color),
              const SizedBox(width: 16),
              Expanded(
                child: InfoContent(title: item.title, value: item.value),
              ),
              if (item.onTap != null)
                Icon(Icons.open_in_new, size: 18, color: item.color),
            ],
          ),
        ),
      ),
    );
  }
}