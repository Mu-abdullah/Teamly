import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';

class ZoomSlider extends StatelessWidget {
  const ZoomSlider({
    super.key,
    required this.zoomLevel,
    required this.onZoomChanged,
    this.minZoom = 1.0,
    this.maxZoom = 3.0,
    this.divisions = 5,
  });

  final double zoomLevel;
  final ValueChanged<double> onZoomChanged;
  final double minZoom;
  final double maxZoom;
  final int divisions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _ZoomIcon(icon: Icons.zoom_out, onTap: () => _adjustZoom(-0.2)),
          Expanded(
            child: Slider(
              value: zoomLevel.clamp(minZoom, maxZoom),
              min: minZoom,
              max: maxZoom,
              divisions: divisions,
              label: '${(zoomLevel * 100).toStringAsFixed(0)}%',
              onChanged: onZoomChanged,
              activeColor: AppColors.blueBlack,
              inactiveColor: AppColors.grey,
            ),
          ),
          _ZoomIcon(icon: Icons.zoom_in, onTap: () => _adjustZoom(0.2)),
        ],
      ),
    );
  }

  void _adjustZoom(double delta) {
    final newZoom = (zoomLevel + delta).clamp(minZoom, maxZoom);
    onZoomChanged(newZoom);
  }
}

class _ZoomIcon extends StatelessWidget {
  const _ZoomIcon({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(icon, color: AppColors.blueBlack, size: 24),
      ),
    );
  }
}
