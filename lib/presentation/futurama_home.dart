import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/characters/screens/characters_screen.dart';
import 'package:futurama_app/presentation/home/home_screen.dart';
import 'package:futurama_app/presentation/quiz/screens/quiz_screen.dart';

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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Characters",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: "Quiz",
          ),
        ],
      ),
    );
  }
}
