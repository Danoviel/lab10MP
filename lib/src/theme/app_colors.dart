import 'package:flutter/material.dart';

/// Paleta extraída de la web real de HBO Max (PE) con Playwright.
/// Centralizamos los colores aquí para no repetir literales por toda la UI.
abstract class AppColors {
  // Fondo principal del sitio: rgb(18,12,29) — morado casi negro.
  static const Color background = Color(0xFF120C1D);

  // Fondo de las tarjetas de planes: rgb(25,25,25).
  static const Color surface = Color(0xFF191919);

  // Variante un poco más clara para superficies elevadas / hovers.
  static const Color surfaceLight = Color(0xFF232323);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Texto secundario / descripciones.
  static const Color textMuted = Color(0xFFB3B3B3);
  static const Color textFaint = Color(0xFF8A8A8A);

  // Bordes sutiles entre secciones / dentro de cards.
  static const Color divider = Color(0xFF2A2533);

  // Acento de marca (morado HBO Max). Lo usamos en los placeholders
  // de pósters para que se vean intencionales y no como cajas vacías.
  static const Color brandPurple = Color(0xFF5C16C5);
  static const Color brandPurpleLight = Color(0xFF8B5CF6);

  /// Gradiente de marca usado en logos y placeholders de contenido.
  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brandPurple, brandPurpleLight],
  );

  /// Overlay oscuro que la web aplica sobre el mosaico del hero para
  /// que el logo y el texto tengan contraste suficiente.
  static const LinearGradient heroOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xCC120C1D),
      Color(0x99120C1D),
      Color(0xFF120C1D),
    ],
    stops: [0.0, 0.45, 1.0],
  );
}
