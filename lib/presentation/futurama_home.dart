import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/characters/screens/characters_screen.dart';
import 'package:futurama_app/presentation/home/home_screen.dart';
import 'package:futurama_app/presentation/quiz/screens/quiz_screen.dart';
import 'package:futurama_app/presentation/settings/settings_screen.dart';

class FuturamaHome extends StatefulWidget {
  const FuturamaHome({Key? key}) : super(key: key);

  @override
  State<FuturamaHome> createState() => _FuturamaHomeState();
}

class _FuturamaHomeState extends State<FuturamaHome> {
  late final PageController _pageController;

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const CharactersScreen(),
    const QuizScreen(),
    const SettingsScreen(),
  ];

  void _handlePageTap(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _handlePageTap(index),
        items: [
          BottomNavigationBarItem(
            icon: Semantics(
              label: "An icon for navigating to the home screen",
              enabled: _selectedIndex == 0,
              child: const Icon(Icons.home),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Semantics(
              label: "An icon for navigating to the characters screen",
              enabled: _selectedIndex == 1,
              child: const Icon(Icons.category),
            ),
            label: "Characters",
          ),
          BottomNavigationBarItem(
            icon: Semantics(
              label: "An icon for navigating to the quiz screen",
              enabled: _selectedIndex == 2,
              child: const Icon(Icons.quiz),
            ),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Semantics(
              label: "An icon for navigating to the settings screen",
              enabled: _selectedIndex == 3,
              child: const Icon(Icons.settings),
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
