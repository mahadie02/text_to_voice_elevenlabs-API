import 'package:flutter/material.dart';

class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    });
  }
}

Color mainColor = const Color.fromARGB(255, 185, 185, 237);

BoxShadow shadowGlow = BoxShadow(
  color: AppData().primaryColorDark.withOpacity(0.6),
  blurRadius: 5,
  spreadRadius: 1.5,
);

class AppData {
  // Variables //
  Color primaryColorDark = mainColor;
  MaterialColor primarySwatch = MaterialColorGenerator.from(mainColor);
  Color bgColorLight = Colors.white;
  Color bgColorDark = Colors.black;

  // Dar Theme //
  ThemeData buildDarkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primarySwatch,
      ),
      scaffoldBackgroundColor: bgColorDark,
      appBarTheme: AppBarTheme(
          backgroundColor: bgColorDark,
          titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: primaryColorDark)),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[900]),
      primaryColor: primaryColorDark,
      hintColor: primaryColorDark,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: primaryColorDark), // Apply to body text
        titleLarge:
            TextStyle(color: primaryColorDark), // Apply to app bar titles
        titleMedium: TextStyle(color: primaryColorDark),
        titleSmall: TextStyle(color: primaryColorDark),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppData().primaryColorDark),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;
  const BodyText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: AppData().primaryColorDark),
    );
  }
}
