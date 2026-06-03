import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

/// Tema global del clon. Toda la app es dark, igual que HBO Max.
/// Usamos la fuente del sistema (sans-serif) como sustituto de "Max Sans".
abstract class AppTheme {
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: base.colorScheme.copyWith(
        surface: AppColors.background,
        primary: AppColors.white,
        secondary: AppColors.brandPurpleLight,
      ),
      dividerColor: AppColors.divider,
      // Poppins como fuente base de toda la app.
      textTheme: base.textTheme.apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
        fontFamily: AppFonts.body,
      ),
    );
  }

  // Tamaños de texto reutilizables (la web escala estos según breakpoint;
  // acá los dejamos como base y ajustamos en cada widget responsive).
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
    letterSpacing: 0.5,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    height: 1.5,
    color: AppColors.textMuted,
  );
}
