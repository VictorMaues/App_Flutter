import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Super App Mãe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(103, 58, 183, 1)),
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
        title: Row(
          children: [
            // O Flutter nativamente não compila SVG. Precisamos usar o SvgPicture
            SvgPicture.asset(
              'assets/images/Group.svg',
              height: 40, // Ajuste a altura conforme necessário
              placeholderBuilder: (BuildContext context) => const Icon(Icons.image, size: 30),
            ),
            const SizedBox(width: 10), // Espaçamento entre a imagem e o texto
            const Text('Sistema Mãe'),
          ],
        ),
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
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromRGBO(103, 58, 183, 1),
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(height: 50.0), // Substitua 'bottomAppButton' pelo seu widget
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'main_fab',
        onPressed: () {}, // Substitua 'onPress' pela sua função
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

