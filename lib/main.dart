import 'package:flutter/material.dart';
import 'src/screens/home_screen.dart';
import 'src/theme/app_theme.dart';

void main() {
  runApp(const HboMaxCloneApp());
}

/// Clon de la landing de HBO Max (PE) — ejercicio de UI responsive.
/// Las imágenes con copyright se sustituyen por placeholders de gradiente.
class HboMaxCloneApp extends StatelessWidget {
  const HboMaxCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HBO Max — Clon',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
