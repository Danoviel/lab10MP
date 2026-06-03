import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Botón CTA principal: fondo blanco, texto negro, radius 8px.
/// Igual al "SUSCRÍBETE AHORA" de la web real.
class SubscribeButton extends StatelessWidget {
  const SubscribeButton({
    super.key,
    this.label = 'SUSCRÍBETE AHORA',
    this.onPressed,
    this.expand = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
      child: Text(label),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
