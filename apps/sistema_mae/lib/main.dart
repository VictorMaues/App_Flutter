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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Menu de Módulos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Academia'),
              onTap: () {
                // Fecha o sidebar antes de navegar
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AcademiaScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance),
              title: const Text('Banco'),
              onTap: () {
                // Fecha o sidebar antes de navegar
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BancoScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Foto1.jpg',
              width: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-vindo ao App!\nAcessar os módulos pelo menu lateral.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

