import 'package:flutter/material.dart';
import '../models/models.dart';
import '../responsive/responsive.dart';
import 'poster_placeholder.dart';

/// Grid de tarjetas apaisadas (16:9) como las de Max en "Estrenos" y
/// "Descubre": 3 columnas en desktop, 2 en tablet, 1 en móvil.
class PosterGrid extends StatelessWidget {
  const PosterGrid({super.key, required this.posters});

  final List<Poster> posters;

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    final columns = r.value<int>(mobile: 1, tablet: 2, desktop: 3);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posters.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 16 / 9,
      ),
      itemBuilder: (context, i) {
        final p = posters[i];
        // aspectRatio: null => la tarjeta llena la celda (el grid define 16:9).
        return PosterPlaceholder(
          title: p.title,
          gradient: p.gradient,
          imageAsset: p.imageAsset,
          aspectRatio: null,
          borderRadius: 8,
        );
      },
    );
  }
}
