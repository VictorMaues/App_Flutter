import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:banco_modulo/banco_modulo.dart';

void main() {
  testWidgets('Testa se o contador do banco funciona', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BancoScreen()));

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
