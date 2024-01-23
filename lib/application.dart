import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manaze/routes.dart';
import 'package:manaze/screens/home/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(brightness: Brightness.light);
    return GetMaterialApp(
      theme: baseTheme.copyWith(
        appBarTheme: baseTheme.appBarTheme.copyWith(
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
          elevation: 0,
          titleTextStyle: TextStyle(color: baseTheme.hintColor, fontSize: 12),
          iconTheme: IconThemeData(color: baseTheme.hintColor, size: 18),
        ),
        textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
        scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
      ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
