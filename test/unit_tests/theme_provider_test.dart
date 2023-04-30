import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_app/themes/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final Map<String, Object> values = <String, Object>{
    'theme': ThemeMode.dark.name
  };
  SharedPreferences.setMockInitialValues(values);

  late ThemeProvider sut;

  setUp(() {
    sut = ThemeProvider();
  });

  test("Test that initial values are correct", () {
    expect(sut.themeMode, ThemeMode.system);
  });

  test("""updateThemeMode,
    Testing that themeMode was successfully persisted using SharedPreferences,
    Testing that the themeMode is persisted in the ThemeProvider""", () async {
    await sut.updateThemeMode(ThemeMode.dark);

    SharedPreferences pref = await SharedPreferences.getInstance();

    expect(pref.getString('theme'), 'dark');
    expect(sut.themeMode, ThemeMode.dark);
  });

  test("""initializeTheme,
    Testing that initialization works well from SharePreferences""", () async {
    await sut.initializeTheme();

    SharedPreferences pref = await SharedPreferences.getInstance();

    expect(pref.getString('theme'), 'dark');
    expect(sut.themeMode, ThemeMode.dark);
  });
}
