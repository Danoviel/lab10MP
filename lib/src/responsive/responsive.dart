import 'package:flutter/widgets.dart';

/// Helper de breakpoints. La web de HBO Max cambia de layout móvil
/// (1 columna) a desktop (ancho centrado con varias columnas) alrededor
/// de los 900px. Centralizamos esa lógica para no repetir MediaQuery.
class Responsive {
  Responsive(this.width);

  factory Responsive.of(BuildContext context) =>
      Responsive(MediaQuery.sizeOf(context).width);

  final double width;

  static const double mobileMax = 600;
  static const double tabletMax = 900;

  /// Ancho máximo del contenido centrado en desktop (como el container
  /// central de la web real).
  static const double contentMaxWidth = 1120;

  bool get isMobile => width < mobileMax;
  bool get isTablet => width >= mobileMax && width < tabletMax;
  bool get isDesktop => width >= tabletMax;

  /// Devuelve un valor distinto según el tamaño de pantalla.
  T value<T>({required T mobile, T? tablet, required T desktop}) {
    if (isDesktop) return desktop;
    if (isTablet) return tablet ?? desktop;
    return mobile;
  }

  /// Padding horizontal de las secciones, más ajustado en móvil.
  double get horizontalPadding => value(mobile: 20, tablet: 32, desktop: 48);
}
