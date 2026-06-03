import 'package:flutter/material.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import 'hbo_max_logo.dart';
import 'subscribe_button.dart';

/// Hero principal. La web usa un mosaico de pósters de fondo con un overlay
/// oscuro encima. Aquí recreamos el mosaico con una grilla de gradientes
/// (placeholders) y aplicamos el mismo overlay para legibilidad.
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    final height = r.value<double>(mobile: 480, tablet: 540, desktop: 620);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const _MosaicBackground(),
          const DecoratedBox(
            decoration: BoxDecoration(gradient: AppColors.heroOverlay),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: r.horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HboMaxLogo(height: r.value(mobile: 64, desktop: 96)),
                const SizedBox(height: 24),
                const Text(
                  'Los planes empiezan desde S/.17,90/mes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 28),
                const SubscribeButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Mosaico de fondo: grilla de bloques con gradiente que imita la pared
/// de pósters de la web. Se adapta el número de columnas al ancho.
class _MosaicBackground extends StatelessWidget {
  const _MosaicBackground();

  static const _palette = [
    [Color(0xFF6D28D9), Color(0xFF4C1D95)],
    [Color(0xFF0EA5E9), Color(0xFF1E3A8A)],
    [Color(0xFFEF4444), Color(0xFF7F1D1D)],
    [Color(0xFFF59E0B), Color(0xFF92400E)],
    [Color(0xFF10B981), Color(0xFF064E3B)],
    [Color(0xFFEC4899), Color(0xFF831843)],
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = (width / 130).ceil().clamp(3, 12);

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        childAspectRatio: 2 / 3,
      ),
      itemCount: columns * 6,
      itemBuilder: (context, i) {
        final colors = _palette[i % _palette.length];
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ),
            border: Border.all(color: AppColors.background, width: 1),
          ),
        );
      },
    );
  }
}
