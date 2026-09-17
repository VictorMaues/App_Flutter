import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:academia_modulo/academia_modulo.dart';

void main() {
  testWidgets('Testa se o contador da academia funciona', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AcademiaScreen()));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
