import 'package:flutter/material.dart';
import '../widgets/discover_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/featured_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/genres_grid_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/new_releases_section.dart';
import '../widgets/plans_section.dart';
import '../widgets/top_nav_bar.dart';

/// Pantalla principal: arma la landing completa en un scroll vertical,
/// replicando el orden de secciones de la web real de HBO Max.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileNavDrawer(),
      body: Builder(
        builder: (context) => CustomScrollView(
          slivers: [
            // Nav bar que se pega arriba al hacer scroll.
            SliverPersistentHeader(
              pinned: true,
              delegate: _NavBarDelegate(
                onMenuTap: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            const SliverList(
              delegate: SliverChildListDelegate.fixed([
                HeroSection(),
                PlansSection(),
                FeaturedSection(),
                GenresGridSection(),
                NewReleasesSection(),
                DiscoverSection(),
                FaqSection(),
                FooterSection(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

/// Mantiene la TopNavBar fija arriba (pinned) con altura constante.
class _NavBarDelegate extends SliverPersistentHeaderDelegate {
  _NavBarDelegate({required this.onMenuTap});

  final VoidCallback onMenuTap;
  static const double _height = 64;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return TopNavBar(onMenuTap: onMenuTap);
  }

  @override
  double get maxExtent => _height;

  @override
  double get minExtent => _height;

  @override
  bool shouldRebuild(_NavBarDelegate oldDelegate) => false;
}
