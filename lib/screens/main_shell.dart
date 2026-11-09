import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'placeholder_screen.dart';

/// "Moldura" principal do app: mostra a aba escolhida e a barra inferior.
/// É um StatefulWidget porque precisa lembrar qual aba está selecionada,
/// e isso muda quando o usuário toca na barra.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // Índice da aba atual: 0 = Início, 1 = Levantamentos, 2 = Perfil.
  int _currentIndex = 0;

  // As telas de cada aba, na mesma ordem da barra.
  final List<Widget> _pages = const [
    HomeScreen(),
    PlaceholderScreen(title: 'Levantamentos'),
    PlaceholderScreen(title: 'Perfil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack mantém todas as abas "vivas" e só mostra a selecionada.
      // Assim, ao trocar de aba, você não perde o que estava fazendo nela.
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          // setState avisa o Flutter: "algo mudou, redesenhe a tela".
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.folder_open_outlined),
            selectedIcon: Icon(Icons.folder_open),
            label: 'Levantamentos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}