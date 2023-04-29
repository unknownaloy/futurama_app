import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:futurama_app/themes/light_theme/light_text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.red,
      elevation: 0.0,
      //backgroundColor: kAppbarColor,
      //iconTheme: IconThemeData(color: kWhiteColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff000000),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: kLightTextTheme,
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.orangeAccent)
      )
    )
    // iconTheme: const IconThemeData(color: kWhiteColor),
    // textButtonTheme: kTextButtonThemeData(),
    // bottomSheetTheme: kBottomSheetTheme(),
    // timePickerTheme: const TimePickerThemeData(),
    // elevatedButtonTheme: kElevatedButtonThemeData(),
  );
}
