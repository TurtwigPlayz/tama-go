import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color redColor = Color(0xFFFFB3B0);
const Color greenColor = Color(0xFFC9DE8C);
const Color blueColor = Color(0xFFAEC3FF);
const Color yellowColor = Color(0xFFFFF2A6);

const Color priceTextColor = Color(0xFF4F4F4F);

final String? fontFamily = GoogleFonts.ubuntu().fontFamily;

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  cardColor: const Color(0xFF4F4F4F),
  shadowColor: const Color(0xFF323232),
  scaffoldBackgroundColor: const Color(0xFF121212),
  dialogBackgroundColor: const Color(0xFF121212),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1A1A1A),
  ),
  iconTheme: const IconThemeData(color: Color(0xFFFAFAFA)),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: const Color(0xFFFAFAFA),
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      color: const Color(0xFFFAFAFA),
      fontFamily: fontFamily,
    ),
  ),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  cardColor: const Color(0xFFA3A3A3),
  shadowColor: const Color(0xFFB1B1B1),
  scaffoldBackgroundColor: const Color(0xFFDDDDDD),
  dialogBackgroundColor: const Color(0xFFD6D6D6),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFE9E9E9),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF121212)),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: const Color(0xFF121212),
      fontFamily: fontFamily,
    ),
    bodySmall: TextStyle(
      color: const Color(0xFF121212),
      fontFamily: fontFamily,
    ),
  ),
);
