import 'package:flutter/material.dart';
import 'package:futurama_app/presentation/futurama_home.dart';
import 'package:futurama_app/presentation/home/home_view_model.dart';
import 'package:futurama_app/repositories/api_services.dart';
import 'package:futurama_app/themes/light_theme/light_theme.dart';
import 'package:futurama_app/utilities/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();

  runApp(const MyApp());

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
      ],
      child: MaterialApp(
        title: 'Futurama App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        home: const FuturamaHome(),
      ),
    );
  }
}
