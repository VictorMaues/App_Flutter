import 'package:flutter/material.dart';

// No mundo real, os módulos exporiam suas próprias telas ou rotas (ex: AcademiaApp, BancoApp)
// Aqui estamos importando-os apenas para mostrar a dependência
import 'package:academia_modulo/academia_modulo.dart';
import 'package:banco_modulo/banco_modulo.dart';

void main() {
  runApp(const SistemaMae());
}

class SistemaMae extends StatelessWidget {
  const SistemaMae({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super App Mãe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema Mãe'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo ao Super App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.fitness_center),
              label: const Text('Acessar Módulo Academia'),
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AcademiaScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.account_balance),
              label: const Text('Acessar Módulo Banco'),
              style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BancoScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
