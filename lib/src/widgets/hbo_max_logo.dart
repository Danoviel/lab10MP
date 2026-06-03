import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Logotipo "HBO max" reconstruido con tipografía (no es el SVG oficial).
/// "HBO" en mayúsculas bold y "max" pegado debajo en minúsculas finas,
/// imitando el lockup del wordmark real.
class HboMaxLogo extends StatelessWidget {
  const HboMaxLogo({super.key, this.height = 40, this.color = AppColors.white});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'HBO',
          style: TextStyle(
            color: color,
            fontSize: height * 0.62,
            fontWeight: FontWeight.w900,
            letterSpacing: height * 0.02,
            height: 0.95,
          ),
        ),
        Text(
          'max',
          style: TextStyle(
            color: color,
            fontSize: height * 0.46,
            fontWeight: FontWeight.w300,
            letterSpacing: height * 0.04,
            height: 0.9,
          ),
        ),
      ],
    );
  }
}
