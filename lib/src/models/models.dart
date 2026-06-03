import 'package:flutter/material.dart';

/// Modelos de datos del clon. Son value objects simples (inmutables),
/// sin lógica de negocio: la landing solo muestra datos estáticos.

/// Un plan de suscripción (Básico, Estándar, Platino).
@immutable
class SubscriptionPlan {
  const SubscriptionPlan({
    required this.name,
    required this.monthlyPrice,
    required this.annualTotal,
    required this.features,
    this.highlighted = false,
  });

  final String name;
  final String monthlyPrice; // p.ej. "S/17.90/mes"
  final String annualTotal; // p.ej. "Precio total anual S/214.80"
  final List<String> features;
  final bool highlighted;
}

/// Un tile del grid de géneros del hero ("NIÑOS Y FAMILIA", etc.).
@immutable
class GenreTile {
  const GenreTile({
    required this.category,
    required this.title,
    this.subtitle,
    required this.gradient,
  });

  final String category; // categoría en mayúsculas (NIÑOS Y FAMILIA)
  final String title; // título del contenido
  final String? subtitle; // marca opcional (HBO ORIGINAL, MAX ORIGINAL)
  final List<Color> gradient; // color del placeholder
}

/// Un póster de contenido (sección "Estrenos" y carrusel "Descubre").
/// Si [imageAsset] viene dado, se muestra esa imagen real; si no, se usa
/// el [gradient] como placeholder. Así conviven imágenes propias y cajas.
@immutable
class Poster {
  const Poster({
    required this.title,
    required this.gradient,
    this.imageAsset,
  });

  final String title;
  final List<Color> gradient;
  final String? imageAsset;
}

/// Un título "destacado" con imagen de fondo apaisada (banner grande).
@immutable
class FeaturedTitle {
  const FeaturedTitle({
    required this.name,
    required this.label,
    required this.description,
    required this.imageAsset,
  });

  final String name; // se muestra con la fuente display (Anton)
  final String label; // marca / categoría (Bebas Neue)
  final String description; // sinopsis corta (Poppins)
  final String imageAsset;
}

/// Una pregunta del acordeón de FAQ.
@immutable
class FaqItem {
  const FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}
