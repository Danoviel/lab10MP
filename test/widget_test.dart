// Smoke test del clon de HBO Max: verifica que la landing renderiza
// y muestra textos clave de la web (CTA y precios de los planes).

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab10/main.dart';

void main() {
  testWidgets('La landing renderiza el CTA y los planes', (tester) async {
    // Usamos un viewport ancho para forzar el layout desktop.
    tester.view.physicalSize = const Size(1440, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const HboMaxCloneApp());

    // El hero muestra el CTA principal.
    expect(find.text('SUSCRÍBETE AHORA'), findsWidgets);

    // Los nombres de los 3 planes están presentes.
    expect(find.text('Básico con anuncios'), findsOneWidget);
    expect(find.text('Estándar'), findsOneWidget);
    expect(find.text('Platino'), findsOneWidget);
  });
}
