import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../responsive/responsive.dart';
import '../theme/app_colors.dart';
import 'section_container.dart';

/// Footer: links de navegación, links legales, copyright e iconos sociales.
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);

    return SectionContainer(
      verticalPadding: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 28,
            runSpacing: 14,
            children: SampleData.footerNav
                .map((l) => _FooterLink(l, bold: true))
                .toList(),
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.divider),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children:
                SampleData.footerLegal.map((l) => _FooterLink(l)).toList(),
          ),
          const SizedBox(height: 28),
          Text(
            SampleData.copyright,
            style: const TextStyle(
              color: AppColors.textFaint,
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment:
                r.isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: const [
              _SocialIcon(Icons.facebook),
              _SocialIcon(Icons.play_circle_fill), // YouTube
              _SocialIcon(Icons.close), // X
              _SocialIcon(Icons.music_note), // TikTok
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  const _FooterLink(this.label, {this.bold = false});

  final String label;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        label,
        style: TextStyle(
          color: bold ? AppColors.white : AppColors.textMuted,
          fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: InkWell(
        onTap: () {},
        child: Icon(icon, color: AppColors.textMuted, size: 24),
      ),
    );
  }
}
