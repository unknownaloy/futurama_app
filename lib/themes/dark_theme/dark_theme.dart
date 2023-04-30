import 'package:flutter/material.dart';
import 'package:futurama_app/themes/dark_theme/dark_text_theme.dart';

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      color: Color(0xff8A8A8A),
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: kDarkTextTheme,
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0xffF2BC8C),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      selectedItemColor: Color(0xff7AC7F0),
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xff8A8A8A),
      // backgroundColor: Color(0xffEDF0F5),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: Color(0xff7AC7F0),
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff3474EF),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size.fromHeight(
            64,
          ),
        ),
      ),
    ),
  );
}
