import 'package:flutter/material.dart';

ThemeData LightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: const Color(0x33EEF0F4),
  appBarTheme: AppBarTheme(backgroundColor: Color(0x33EEF0F4),elevation: 0,iconTheme: IconThemeData(color: Colors.black))
);

ThemeData DarkTheme = ThemeData(
  brightness: Brightness.dark
);