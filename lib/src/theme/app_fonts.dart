/// Nombres de las 3 familias tipográficas declaradas en pubspec.yaml.
/// Centralizarlos evita escribir el string del family a mano por la UI
/// (un typo en el nombre haría que Flutter caiga al font por defecto sin avisar).
abstract class AppFonts {
  /// Títulos de impacto, tipo póster (hero, nombres de héroes destacados).
  static const String display = 'Anton';

  /// Etiquetas y categorías en mayúsculas condensadas (chips, badges).
  static const String label = 'BebasNeue';

  /// Texto de cuerpo y UI general. Es la familia por defecto del tema.
  static const String body = 'Poppins';
}
