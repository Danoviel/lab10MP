import 'package:flutter/material.dart';
import '../models/models.dart';

/// Datos estáticos que alimentan la landing. Los textos (planes, precios,
/// géneros, FAQ) se extrajeron de la web real de HBO Max PE. Los pósters
/// se representan con gradientes (placeholders) en vez de imágenes con
/// copyright; reemplaza por tus propios assets cuando quieras.
abstract class SampleData {
  static const List<String> navLinks = [
    'Películas',
    'Series de TV',
    'Niños y Familia',
    'Marcas',
  ];

  static const List<SubscriptionPlan> plans = [
    SubscriptionPlan(
      name: 'Básico con anuncios',
      monthlyPrice: 'S/17.90/mes',
      annualTotal: 'Precio total anual S/214.80',
      features: [
        '2 dispositivos a la vez',
        'Resolución Full HD',
      ],
    ),
    SubscriptionPlan(
      name: 'Estándar',
      monthlyPrice: 'S/26.90/mes',
      annualTotal: 'Precio total anual S/322.80',
      highlighted: true,
      features: [
        '2 dispositivos a la vez',
        'Resolución Full HD',
        '30 descargas para disfrutar offline',
      ],
    ),
    SubscriptionPlan(
      name: 'Platino',
      monthlyPrice: 'S/35.90/mes',
      annualTotal: 'Precio total anual S/430.80',
      features: [
        '4 dispositivos a la vez',
        'Resolución Full HD y 4K Ultra HD *',
        'Audio Dolby Atmos *',
        '100 descargas para disfrutar offline',
      ],
    ),
  ];

  // Paletas de gradiente para variar el aspecto de los placeholders.
  static const _g1 = [Color(0xFF6D28D9), Color(0xFFEC4899)];
  static const _g2 = [Color(0xFF0EA5E9), Color(0xFF2563EB)];
  static const _g3 = [Color(0xFFF59E0B), Color(0xFFEF4444)];
  static const _g4 = [Color(0xFF10B981), Color(0xFF065F46)];
  static const _g5 = [Color(0xFF8B5CF6), Color(0xFF312E81)];
  static const _g6 = [Color(0xFFEF4444), Color(0xFF7F1D1D)];

  static const List<GenreTile> genres = [
    GenreTile(category: 'NIÑOS Y FAMILIA', title: 'PEPPA PIG', gradient: _g3),
    GenreTile(category: 'REALITY', title: 'TODO EN 90 DÍAS', gradient: _g2),
    GenreTile(
      category: 'NOVELAS',
      title: '¿SERÁ QUE ES AMOR?',
      subtitle: 'MAX ORIGINAL',
      gradient: _g1,
    ),
    GenreTile(category: 'CINE', title: 'GODZILLA VS KONG', gradient: _g5),
    GenreTile(
      category: 'DRAMA',
      title: 'JUEGO DE TRONOS',
      subtitle: 'HBO ORIGINAL',
      gradient: _g6,
    ),
    GenreTile(
      category: 'ACCIÓN',
      title: 'THE LAST OF US',
      subtitle: 'HBO ORIGINAL',
      gradient: _g4,
    ),
    GenreTile(
      category: 'COMEDIA',
      title: 'THE BIG BANG THEORY',
      gradient: _g2,
    ),
    GenreTile(category: 'DOCUMENTALES', title: 'FAMA INFANTIL', gradient: _g5),
  ];

  // Grids horizontales (16:9) con tus imágenes. Se ven como las tarjetas
  // apaisadas de Max ("Estrenos" y "Descubre").
  static const List<Poster> newReleases = [
    Poster(title: 'Batman', gradient: _g6, imageAsset: '$_img/Batman.jpg'),
    Poster(title: 'Superman', gradient: _g2, imageAsset: '$_img/Super1.jpg'),
    Poster(title: 'Moon Knight', gradient: _g5, imageAsset: '$_img/Moon1.jpg'),
    Poster(title: 'Moon Knight', gradient: _g5, imageAsset: '$_img/Moon2.jpg'),
    Poster(title: 'Superman', gradient: _g2, imageAsset: '$_img/Super2.jpg'),
    Poster(title: 'Batman', gradient: _g6, imageAsset: '$_img/Batman2.jpg'),
  ];

  // ---- Contenido con imágenes reales (assets/images/, provistas por el usuario) ----

  static const String _img = 'assets/images';

  /// Título destacado con banner apaisado grande (Batman.jpg, 3840x2160).
  static const FeaturedTitle featured = FeaturedTitle(
    name: 'BATMAN',
    label: 'DC ORIGINAL',
    description:
        'Gotham necesita un héroe. Sumérgete en la oscuridad del Caballero '
        'de la Noche en esta colección de películas y series imperdibles.',
    imageAsset: '$_img/Batman.jpg',
  );

  /// Carrusel de héroes con tus imágenes. Mezcla formatos: las verticales
  /// lucen como póster y las apaisadas se recortan con BoxFit.cover.
  static const List<Poster> heroPosters = [
    Poster(title: 'Superman', gradient: _g2, imageAsset: '$_img/Super2.jpg'),
    Poster(title: 'Batman', gradient: _g6, imageAsset: '$_img/Batman2.jpg'),
    Poster(title: 'Moon Knight', gradient: _g5, imageAsset: '$_img/Moon1.jpg'),
    Poster(title: 'Moon Knight', gradient: _g5, imageAsset: '$_img/Moon2.jpg'),
    Poster(title: 'Superman', gradient: _g2, imageAsset: '$_img/Super1.jpg'),
    Poster(title: 'Batman', gradient: _g6, imageAsset: '$_img/Batman.jpg'),
  ];

  static const List<String> discoverTabs = [
    'Drama',
    'Realities',
    'Acción',
    'Comedia',
    'Crimen',
    'Novelas',
    'Suspenso',
    'Sci-Fi',
  ];

  static const List<Poster> discoverPosters = [
    Poster(title: 'Superman', gradient: _g2, imageAsset: '$_img/Super2.jpg'),
    Poster(title: 'Moon Knight', gradient: _g5, imageAsset: '$_img/Moon2.jpg'),
    Poster(title: 'Batman', gradient: _g6, imageAsset: '$_img/Batman.jpg'),
    Poster(title: 'Moon Knight', gradient: _g5, imageAsset: '$_img/Moon1.jpg'),
    Poster(title: 'Superman', gradient: _g2, imageAsset: '$_img/Super1.jpg'),
    Poster(title: 'Batman', gradient: _g6, imageAsset: '$_img/Batman2.jpg'),
  ];

  static const List<FaqItem> faqs = [
    FaqItem(
      question: '¿Cómo me registro?',
      answer:
          'Elige el plan que más te convenga, crea tu cuenta con tu correo '
          'electrónico y completa el pago. En minutos estarás disfrutando de '
          'todo el catálogo de HBO Max.',
    ),
    FaqItem(
      question: '¿Dónde está disponible HBO Max?',
      answer:
          'HBO Max está disponible en Perú y en gran parte de Latinoamérica. '
          'Puedes verlo en tu navegador o en la app desde cualquier lugar del país.',
    ),
    FaqItem(
      question: '¿Cuánto cuesta HBO Max?',
      answer:
          'Los planes empiezan desde S/17.90 al mes con el plan Básico con '
          'anuncios. También están los planes Estándar (S/26.90) y Platino (S/35.90).',
    ),
    FaqItem(
      question: '¿En qué dispositivos funciona HBO Max?',
      answer:
          'Funciona en smart TVs, teléfonos, tablets, computadoras, consolas '
          'de videojuegos y dispositivos de streaming compatibles.',
    ),
    FaqItem(
      question: 'Tengo HBO ¿Tengo acceso a HBO Max?',
      answer:
          'Depende de tu proveedor. En muchos casos puedes vincular tu '
          'suscripción existente; revisa la sección de ayuda para tu caso.',
    ),
  ];

  static const List<String> footerNav = [
    'Ahora en HBO Max',
    'Películas',
    'Series de TV',
    'Ver Tráilers y Extras Gratis',
    'Niños y Familia',
    'Ayuda',
  ];

  static const List<String> footerLegal = [
    'Accesibilidad',
    'Política de Privacidad',
    'Modo Infantil',
    'Términos de Uso',
    'Administrar Cookies',
    'Comunicados de prensa',
  ];

  static const String copyright =
      '©2025 WarnerMedia Direct Latin America, LLC. Todos los derechos '
      'reservados. HBO Max se usa bajo licencia.';

  static const String tagline =
      'HBO Max es el lugar de las grandes historias, los dramas intensos y '
      'las mejores comedias.';
}
