import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData LightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: const Color(0x33EEF0F4),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0x33EEF0F4),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),),
        textTheme: GoogleFonts.workSansTextTheme(),
        
        );

ThemeData DarkTheme = ThemeData(brightness: Brightness.dark);
