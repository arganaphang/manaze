import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manaze/routes.dart';
import 'package:manaze/screens/home/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: const Color.fromARGB(255, 234, 221, 187),
    );
    return GetMaterialApp(
      theme: baseTheme.copyWith(
        useMaterial3: true,
        appBarTheme: baseTheme.appBarTheme.copyWith(
          elevation: 0,
          titleTextStyle: TextStyle(color: baseTheme.hintColor, fontSize: 18),
          iconTheme: IconThemeData(color: baseTheme.hintColor, size: 18),
        ),
        textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
      ),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
