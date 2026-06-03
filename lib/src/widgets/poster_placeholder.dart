import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Placeholder de póster: un gradiente con el título encima. Sustituye a
/// las imágenes reales (con copyright). Para usar assets propios, cambia
/// el Container del gradiente por un DecorationImage / Image.asset.
class PosterPlaceholder extends StatelessWidget {
  const PosterPlaceholder({
    super.key,
    required this.title,
    required this.gradient,
    this.imageAsset,
    this.aspectRatio = 2 / 3, // formato póster vertical; null = llena el padre
    this.borderRadius = 6,
    this.showTitle = true,
  });

  final String title;
  final List<Color> gradient;
  final String? imageAsset;

  /// Si es null, no se envuelve en AspectRatio y llena el espacio del padre
  /// (útil dentro de un GridView que ya define el aspecto de la celda).
  final double? aspectRatio;
  final double borderRadius;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final card = _buildCard();
    if (aspectRatio == null) return card;
    return AspectRatio(aspectRatio: aspectRatio!, child: card);
  }

  Widget _buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagen real (si la hay) por encima del gradiente.
            if (imageAsset != null)
              Image.asset(imageAsset!, fit: BoxFit.cover),
            if (showTitle) ...[
              // Veladura inferior para que el texto siempre tenga contraste.
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xAA000000)],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
