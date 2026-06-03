import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/models.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import 'section_container.dart';

/// Sección "ELIGE EL MEJOR PLAN PARA TI": tabs (Anual / Mensual) + las
/// 3 tarjetas de planes. En desktop van en fila; en móvil se apilan.
class PlansSection extends StatefulWidget {
  const PlansSection({super.key});

  @override
  State<PlansSection> createState() => _PlansSectionState();
}

class _PlansSectionState extends State<PlansSection> {
  int _selectedTab = 0; // 0 = Anual en cuotas, 1 = Mensual

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);

    return SectionContainer(
      child: Column(
        children: [
          Text(
            'ELIGE EL MEJOR PLAN PARA TI',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppFonts.display,
              fontSize: r.value(mobile: 26, desktop: 38),
              color: AppColors.white,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 28),
          _BillingTabs(
            selected: _selectedTab,
            onChanged: (i) => setState(() => _selectedTab = i),
          ),
          const SizedBox(height: 28),
          _PlansLayout(plans: SampleData.plans, isRow: r.isDesktop),
          const SizedBox(height: 24),
          const Text(
            '*Full HD, 4K Ultra HD y Dolby Atmos no están disponibles en todo '
            'el contenido de cada plan. El contenido en vivo en los planes '
            'Estándar y Platino puede contener publicidad.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textFaint, fontSize: 12, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _BillingTabs extends StatelessWidget {
  const _BillingTabs({required this.selected, required this.onChanged});

  final int selected;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TabButton(
            label: 'Anual en cuotas',
            badge: 'Ahorra 33%',
            selected: selected == 0,
            onTap: () => onChanged(0),
          ),
          _TabButton(
            label: 'Mensual',
            selected: selected == 1,
            onTap: () => onChanged(1),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
    this.badge,
  });

  final String label;
  final String? badge;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: selected ? AppColors.black : AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  gradient: AppColors.brandGradient,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
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

/// Distribuye las 3 cards: fila en desktop, columna en móvil.
class _PlansLayout extends StatelessWidget {
  const _PlansLayout({required this.plans, required this.isRow});

  final List<SubscriptionPlan> plans;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    if (isRow) {
      // IntrinsicHeight acota la altura del Row para que 'stretch' iguale
      // las 3 cards a la altura de la más alta (sin altura infinita).
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < plans.length; i++) ...[
              if (i > 0) const SizedBox(width: 16),
              Expanded(child: _PlanCard(plan: plans[i])),
            ],
          ],
        ),
      );
    }
    return Column(
      children: [
        for (var i = 0; i < plans.length; i++) ...[
          if (i > 0) const SizedBox(height: 16),
          _PlanCard(plan: plans[i]),
        ],
      ],
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.plan});

  final SubscriptionPlan plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: plan.highlighted
            ? Border.all(color: AppColors.brandPurpleLight, width: 1.5)
            : Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(plan.name, style: AppThemeCardTitle.style),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '12x',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14),
              ),
              const SizedBox(width: 8),
              Text(
                plan.monthlyPrice,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            plan.annualTotal,
            style: const TextStyle(color: AppColors.textFaint, fontSize: 12),
          ),
          const SizedBox(height: 18),
          ...plan.features.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check, color: AppColors.brandPurpleLight, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      f,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 14,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.black,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Seleccionar plan',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pequeño helper para no importar el tema completo solo por un estilo.
abstract class AppThemeCardTitle {
  static const style = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
}
