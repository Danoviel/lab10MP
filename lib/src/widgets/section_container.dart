import 'package:flutter/material.dart';
import '../responsive/responsive.dart';

/// Envuelve el contenido de una sección, lo centra y le pone un ancho
/// máximo en desktop (como el container central de la web). Evita repetir
/// la misma lógica de padding/centrado en cada sección.
class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.verticalPadding = 56,
    this.maxWidth = Responsive.contentMaxWidth,
    this.color,
  });

  final Widget child;
  final double verticalPadding;
  final double maxWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    return Container(
      width: double.infinity,
      color: color,
      padding: EdgeInsets.symmetric(
        horizontal: r.horizontalPadding,
        vertical: r.value(mobile: verticalPadding * 0.7, desktop: verticalPadding),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
