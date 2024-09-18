import 'package:flutter/material.dart';

class AppColors {
  // Primary and Secondary Colors
 static const MaterialColor materialPrimary = MaterialColor(
    0xFF763B67,
    <int, Color>{
      50: Color(0xFFF4E9F1),  // 10% lighter
      100: Color(0xFFE4C8DF), // 20% lighter
      200: Color(0xFFD1A3CC), // 30% lighter
      300: Color(0xFFBE7EB9), // 40% lighter
      400: Color(0xFFB062A9), // 50% lighter
      500: Color(0xFF763B67), // Base color
      600: Color(0xFF69355D), // 10% darker
      700: Color(0xFF592E4F), // 20% darker
      800: Color(0xFF492740), // 30% darker
      900: Color(0xFF321B2C), // 40% darker
    },
  );

 static const Color primary = Color(0xff763B67);
  static const Color primary10 = Color(0xff9f7695);
  //-------------------------------------------

  // Status Colors
  static const Color danger = Color(0xFFE10000);
  static const Color warning = Color(0xFFDBBD2A);
  static const Color success = Color(0xFF27D045);

  //-------------------------------------------

  // Normal Colors
  static const Color black = Color(0xFF2E323D);
  static const Color black5 = Color(0xFF080808);
  static const Color black10 = Color(0xFF3B3B39);
  static const Color black20 = Color(0x68525250);
  static const Color black30 = Color(0x26B7B7B7);

  static const Color white = Colors.white;
  static const Color white10 = Color(0xFFFCFCFC);
  static const Color white20 = Color(0xFFF3F3F3);
  static const Color white30 = Color(0xFFF5F5F5);
  static const Color transparent = Colors.transparent;

  static const Color grayDark = Color(0xFF0F3833);
  static const Color gray = Color(0xFF727E96);
  static const Color lightGrey = Color(0xFFEFF2F3);
  static const MaterialColor mainGray = Colors.grey;
  static const Color grayAccent = Color(0xFFDFE0E1);
  static const Color grayMiddle = Color(0xFFD1D8DB);

  static const Color blue = Color(0xFF3C82AA);
  static const Color yellow = Color(0xfffbbc04);
  static const Color backgroundColor = Color(0xfff6def0);

////-------------------------------------------
}
