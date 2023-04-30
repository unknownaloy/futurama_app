import 'package:flutter/material.dart';
import 'package:futurama_app/themes/light_theme/light_text_theme.dart';
import 'package:futurama_app/themes/light_theme/light_theme_text_styles.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        color: Color(0xffEDF0F5),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        )
        //backgroundColor: kAppbarColor,
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: kLightTextTheme,
    chipTheme: const ChipThemeData(
      backgroundColor: Color(0xffF2BC8C),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0.0,
      selectedItemColor: Color(0xff7AC7F0),
      unselectedItemColor: Colors.grey,
      backgroundColor: Color(0xffEDF0F5),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: Color(0xff7AC7F0),
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
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

    // iconTheme: const IconThemeData(color: kWhiteColor),
    // textButtonTheme: kTextButtonThemeData(),
    // bottomSheetTheme: kBottomSheetTheme(),
    // timePickerTheme: const TimePickerThemeData(),
    // elevatedButtonTheme: kElevatedButtonThemeData(),
  );
}
