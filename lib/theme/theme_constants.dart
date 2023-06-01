import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem/theme/app_theme.dart';

final appTheme = AppTheme();

ThemeData LightTheme = ThemeData(
  brightness: Brightness.light,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Color(appTheme.backgroundColor), // Set the text color
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(51, 1, 15, 43),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
  // colorScheme: ColorScheme(background: const Color(0x33EEF0F4)),
);

ThemeData DarkTheme = ThemeData(brightness: Brightness.dark);
