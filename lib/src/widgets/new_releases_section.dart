import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import 'poster_grid.dart';
import 'section_container.dart';
import 'subscribe_button.dart';

/// "Estrenos de los que no pararás de hablar": título centrado + grid
/// horizontal 3×2 (1 columna en móvil) + CTA abajo a la izquierda.
class NewReleasesSection extends StatelessWidget {
  const NewReleasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título centrado (Poppins bold, como en Max).
          SizedBox(
            width: double.infinity,
            child: Text(
              'Estrenos de los que no pararás de hablar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: r.value(mobile: 24, desktop: 38),
                fontWeight: FontWeight.w800,
                color: AppColors.white,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 28),
          PosterGrid(posters: SampleData.newReleases),
          const SizedBox(height: 28),
          // CTA abajo a la izquierda (centrado en móvil).
          Align(
            alignment: r.isMobile ? Alignment.center : Alignment.centerLeft,
            child: const SubscribeButton(),
          ),
        ],
      ),
    );
  }
}
