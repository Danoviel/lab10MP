import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/models.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import 'section_container.dart';

/// Tagline + grid de géneros del hero ("NIÑOS Y FAMILIA / PEPPA PIG", etc.).
/// La web los muestra como tiles tipo póster con la categoría arriba.
class GenresGridSection extends StatelessWidget {
  const GenresGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    final columns = r.value<int>(mobile: 2, tablet: 3, desktop: 4);

    return SectionContainer(
      child: Column(
        children: [
          Text(
            SampleData.tagline,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: r.value(mobile: 20, desktop: 26),
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 36),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: SampleData.genres.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, i) => _GenreCard(tile: SampleData.genres[i]),
          ),
        ],
      ),
    );
  }
}

class _GenreCard extends StatelessWidget {
  const _GenreCard({required this.tile});

  final GenreTile tile;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: tile.gradient,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x33000000), Color(0xCC000000)],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tile.category,
                    style: const TextStyle(
                      fontFamily: AppFonts.label,
                      color: AppColors.white,
                      fontSize: 15,
                      letterSpacing: 1.4,
                    ),
                  ),
                  const Spacer(),
                  if (tile.subtitle != null)
                    Text(
                      tile.subtitle!,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.8,
                      ),
                    ),
                  Text(
                    tile.title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
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
