import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../theme/app_colors.dart';
import 'hbo_max_logo.dart';
import 'section_container.dart';

/// Logo grande + acordeón de FAQ. Cada item se expande/colapsa.
class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      maxWidth: 760,
      child: Column(
        children: [
          const HboMaxLogo(height: 70),
          const SizedBox(height: 40),
          ...SampleData.faqs.map((item) => _FaqTile(item: item)),
        ],
      ),
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.item});

  final dynamic item; // FaqItem

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        // Quitamos las líneas divisorias por defecto del ExpansionTile.
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: AppColors.white,
          collapsedIconColor: AppColors.white,
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
          title: Text(
            item.question,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                item.answer,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
