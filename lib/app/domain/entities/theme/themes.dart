import 'package:flutter/material.dart';

ThemeData darkTheme(BuildContext context) => ThemeData(
      iconTheme: IconThemeData(color: Colors.teal, size: 23),
      fontFamily: 'GoogleSansRegular',
      primaryColor: Colors.black,
      primaryColorDark: Colors.black,
      primaryColorLight: Colors.grey,
      colorScheme: ColorScheme.dark().copyWith(
        primary: Colors.blue,
        secondary: Colors.blue,
      ),
      disabledColor: Colors.grey,
      cardColor: Color(0xff1f2124),
      canvasColor: Colors.black,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 14,
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: Colors.white.withValues(alpha: 0.7),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black.withValues(alpha: 0.7),
        ),
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.blue,
          secondary: Colors.blue,
        ),
        buttonColor: Colors.blue,
        splashColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.black38,
      ),
    );

ThemeData lightTheme(BuildContext context) => ThemeData(
      iconTheme: IconThemeData(color: Colors.teal, size: 23),
      fontFamily: 'GoogleSansRegular',
      primaryColor: Color(0xff192D47),
      primaryColorDark: Colors.black,
      primaryColorLight: Colors.grey,
      colorScheme: ColorScheme.light().copyWith(
        primary: Colors.blue,
        secondary: Colors.blue,
      ),
      disabledColor: Colors.grey,
      cardColor: Colors.white,
      canvasColor: Colors.white,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
        displayMedium: TextStyle(
          fontSize: 20,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 14,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: Colors.black.withValues(alpha: 0.7),
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black.withValues(alpha: 0.7),
        ),
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.blue,
          secondary: Colors.blue,
        ),
        buttonColor: Colors.blue,
        splashColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
