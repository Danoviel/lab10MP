import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import 'hbo_max_logo.dart';

/// Barra de navegación superior. En desktop muestra los links inline a la
/// izquierda y los botones de cuenta a la derecha. En móvil colapsa a un
/// icono de menú (hamburguesa) que abre un Drawer.
class TopNavBar extends StatelessWidget {
  const TopNavBar({super.key, this.onMenuTap});

  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: r.horizontalPadding,
        vertical: 14,
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: Responsive.contentMaxWidth),
          child: r.isDesktop
              ? _DesktopNav()
              : _MobileNav(onMenuTap: onMenuTap),
        ),
      ),
    );
  }
}

class _DesktopNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HboMaxLogo(height: 30),
        const SizedBox(width: 40),
        // Los links toman el espacio disponible y hacen scroll horizontal
        // si la ventana es muy angosta, en vez de desbordar.
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: SampleData.navLinks
                  .map(
                    (link) => Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: _NavLink(link),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        const SizedBox(width: 16),
        _NavLink('Ingresa'),
        const SizedBox(width: 20),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.white,
            side: const BorderSide(color: AppColors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          ),
          child: const Text('Suscríbete ahora'),
        ),
      ],
    );
  }
}

class _MobileNav extends StatelessWidget {
  const _MobileNav({this.onMenuTap});

  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onMenuTap,
          icon: const Icon(Icons.menu, color: AppColors.white),
        ),
        const HboMaxLogo(height: 26),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Ingresa',
            style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// Drawer para móvil con los links de navegación.
class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 16),
              child: HboMaxLogo(height: 28),
            ),
            const Divider(color: AppColors.divider),
            ...SampleData.navLinks.map(
              (link) => ListTile(
                title: Text(
                  link,
                  style: const TextStyle(color: AppColors.white, fontSize: 16),
                ),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
