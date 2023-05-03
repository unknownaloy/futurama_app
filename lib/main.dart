import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:futurama_app/presentation/characters/characters_view_model.dart';
import 'package:futurama_app/presentation/futurama_home.dart';
import 'package:futurama_app/presentation/home/home_view_model.dart';
import 'package:futurama_app/presentation/quiz/quiz_view_model.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/themes/dark_theme/dark_theme.dart';
import 'package:futurama_app/themes/light_theme/light_theme.dart';
import 'package:futurama_app/themes/theme_provider.dart';
import 'package:futurama_app/utilities/service_locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().load('assets/ca/isrgrootx1.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  setupLocator();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider()..initializeTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(
            apiServices: locator<ApiServices>(),
          ),
        ),
        ChangeNotifierProvider<CharactersViewModel>(
          create: (_) => CharactersViewModel(
            apiServices: locator<ApiServices>(),
          ),
        ),
        ChangeNotifierProvider<QuizViewModel>(
          create: (_) => QuizViewModel(
            apiServices: locator<ApiServices>(),
          ),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (_, model, __) => ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp(
            title: 'Futurama App',
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: model.themeMode,
            home: const FuturamaHome(),
          ),
        ),
      ),
    );
  }
}
