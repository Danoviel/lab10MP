import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/models.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import 'poster_grid.dart';
import 'section_container.dart';

/// "DESCUBRE LO MEJOR EN": navegación de tabs tipo carrusel (la del centro
/// grande y blanca, las vecinas difuminadas, con flechas ‹ ›) + grid
/// horizontal 3×2 que rota su contenido según el tab elegido.
class DiscoverSection extends StatefulWidget {
  const DiscoverSection({super.key});

  @override
  State<DiscoverSection> createState() => _DiscoverSectionState();
}

class _DiscoverSectionState extends State<DiscoverSection> {
  int _selected = 0;

  List<String> get _tabs => SampleData.discoverTabs;

  void _move(int delta) {
    setState(() {
      _selected = (_selected + delta + _tabs.length) % _tabs.length;
    });
  }

  /// Rota la lista de pósters para que el grid cambie visualmente al
  /// moverse entre tabs (cada género muestra otro orden).
  List<Poster> get _rotatedPosters {
    final base = SampleData.discoverPosters;
    final off = _selected % base.length;
    return [...base.sublist(off), ...base.sublist(0, off)];
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);

    return SectionContainer(
      child: Column(
        children: [
          Text(
            'DESCUBRE LO MEJOR EN',
            style: TextStyle(
              fontSize: r.value(mobile: 18, desktop: 24),
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: r.value(mobile: 20, desktop: 32)),
          _CarouselTabs(
            tabs: _tabs,
            selected: _selected,
            onPrev: () => _move(-1),
            onNext: () => _move(1),
            onPick: (i) => setState(() => _selected = i),
          ),
          SizedBox(height: r.value(mobile: 24, desktop: 36)),
          PosterGrid(posters: _rotatedPosters),
        ],
      ),
    );
  }
}

/// Cabecera de tabs: ‹  vecino-izq   SELECCIONADO   vecino-der  ›
class _CarouselTabs extends StatelessWidget {
  const _CarouselTabs({
    required this.tabs,
    required this.selected,
    required this.onPrev,
    required this.onNext,
    required this.onPick,
  });

  final List<String> tabs;
  final int selected;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final ValueChanged<int> onPick;

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    final n = tabs.length;
    final prev = (selected - 1 + n) % n;
    final next = (selected + 1) % n;

    final selectedSize = r.value<double>(mobile: 26, desktop: 44);
    final sideSize = r.value<double>(mobile: 16, desktop: 30);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Arrow(icon: Icons.chevron_left, onTap: onPrev),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Vecino izquierdo (difuminado).
              Flexible(
                child: _TabLabel(
                  text: tabs[prev],
                  size: sideSize,
                  color: AppColors.textFaint,
                  onTap: () => onPick(prev),
                ),
              ),
              SizedBox(width: r.value(mobile: 12, desktop: 28)),
              // Seleccionado (grande, blanco).
              _TabLabel(
                text: tabs[selected],
                size: selectedSize,
                color: AppColors.white,
                onTap: () {},
              ),
              SizedBox(width: r.value(mobile: 12, desktop: 28)),
              // Vecino derecho (difuminado).
              Flexible(
                child: _TabLabel(
                  text: tabs[next],
                  size: sideSize,
                  color: AppColors.textFaint,
                  onTap: () => onPick(next),
                ),
              ),
            ],
          ),
        ),
        _Arrow(icon: Icons.chevron_right, onTap: onNext),
      ],
    );
  }
}

class _TabLabel extends StatelessWidget {
  const _TabLabel({
    required this.text,
    required this.size,
    required this.color,
    required this.onTap,
  });

  final String text;
  final double size;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: AppColors.textMuted),
      iconSize: 32,
      splashRadius: 24,
    );
  }
}
