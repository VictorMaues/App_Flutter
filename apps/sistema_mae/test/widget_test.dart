import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sistema_mae/main.dart';

void main() {
  testWidgets('Menu inicial carrega corretamente', (WidgetTester tester) async {
    // Constrói o app e dispara um frame.
    await tester.pumpWidget(const SistemaMae());

    // Verifica se o texto de boas-vindas está na tela.
    expect(find.text('Bem-vindo ao Super App!'), findsOneWidget);
    
    // Verifica se os botões dos módulos existem.
    expect(find.text('Acessar Módulo Academia'), findsOneWidget);
    expect(find.text('Acessar Módulo Banco'), findsOneWidget);
  });
}
