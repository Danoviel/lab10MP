import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/models.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import 'poster_placeholder.dart';
import 'section_container.dart';

/// Sección de contenido destacado con imágenes reales del usuario.
/// Muestra las 3 tipografías en acción: Anton (nombre), Bebas Neue
/// (etiqueta) y Poppins (descripción / botón).
class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    final cardWidth = r.value<double>(mobile: 140, desktop: 180);

    return SectionContainer(
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel('LO MÁS VISTO'),
          const SizedBox(height: 16),
          _FeaturedBanner(title: SampleData.featured),
          const SizedBox(height: 36),
          Text(
            'HÉROES EN HBO MAX',
            style: TextStyle(
              fontFamily: AppFonts.label,
              fontSize: r.value(mobile: 26, desktop: 34),
              color: AppColors.white,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: cardWidth * 1.5,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: SampleData.heroPosters.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (context, i) {
                final poster = SampleData.heroPosters[i];
                return SizedBox(
                  width: cardWidth,
                  child: PosterPlaceholder(
                    title: poster.title,
                    gradient: poster.gradient,
                    imageAsset: poster.imageAsset,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Etiqueta de sección en Bebas Neue con una barra de acento al lado.
class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            gradient: AppColors.brandGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontFamily: AppFonts.label,
            fontSize: 22,
            color: AppColors.textMuted,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}

/// Banner apaisado grande con la imagen de fondo + degradado para que el
/// texto (Anton + Bebas + Poppins) se lea bien encima.
class _FeaturedBanner extends StatelessWidget {
  const _FeaturedBanner({required this.title});

  final FeaturedTitle title;

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    final height = r.value<double>(mobile: 240, tablet: 320, desktop: 420);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(title.imageAsset, fit: BoxFit.cover),
            // Degradado de izquierda y de abajo para contraste del texto.
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xE6000000), Color(0x33000000), Colors.transparent],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(r.value(mobile: 20, desktop: 40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Etiqueta (Bebas Neue).
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: AppColors.brandGradient,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      title.label,
                      style: const TextStyle(
                        fontFamily: AppFonts.label,
                        fontSize: 16,
                        color: AppColors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Nombre (Anton, display).
                  Text(
                    title.name,
                    style: TextStyle(
                      fontFamily: AppFonts.display,
                      fontSize: r.value(mobile: 44, desktop: 76),
                      color: AppColors.white,
                      height: 1.0,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Descripción (Poppins).
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 460),
                    child: Text(
                      title.description,
                      maxLines: r.isMobile ? 2 : 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: AppFonts.body,
                        fontSize: 14,
                        height: 1.5,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  // Botón (Poppins bold).
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, size: 22),
                    label: const Text(
                      'Reproducir',
                      style: TextStyle(
                        fontFamily: AppFonts.body,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
