import 'package:flutter/material.dart';
import 'package:futurama_app/screens/home_screen.dart';
import 'package:futurama_app/themes/light_theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futurama App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
