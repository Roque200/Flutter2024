import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/home_screen.dart';
import 'package:flutter_application_2/screens/intenciones_screen.dart';
import 'package:flutter_application_2/screens/login_screen_2.dart';
import 'package:flutter_application_2/screens/popular_screen.dart';
import 'package:flutter_application_2/screens/splash_screens.dart';
import 'package:flutter_application_2/settings/theme_settings.dart';
import 'package:flutter_application_2/settings/value_listener.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: valueListener.isDark,
      builder: (context,value,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PopularScreen(),
          theme: value 
          ? ThemeSettings.lightTheme(context)
          : ThemeSettings.darkTheme(context),
          routes: {
            "/home" :(context)=>const HomeScreen(),
            "/login2" :(context) => const LoginScreen2(),
            "/intent": (context)=>const IntencionesSreen()
          },
        );
      }
    );
  }
}
