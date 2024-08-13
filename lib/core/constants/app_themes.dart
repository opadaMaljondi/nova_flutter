import 'package:real_state/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppThemes {
  static ThemeData themeEnglish = ThemeData(
    fontFamily: 'Switzer',
    primaryColor: AppColors.materialPrimary,
    scaffoldBackgroundColor: AppColors.white20,
    splashColor: AppColors.materialPrimary.shade200,
    canvasColor: AppColors.white,
    iconTheme: const IconThemeData(
      color: AppColors.black10,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.materialPrimary,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.white,
      iconTheme: const IconThemeData(
        color: AppColors.black10,
      ),
      elevation: 2,
      scrolledUnderElevation: 0,
      titleSpacing: 1,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: SystemUiOverlayStyle.dark.systemNavigationBarColor,
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    indicatorColor: AppColors.primary,
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.materialPrimary.shade800,
      ),
      headlineMedium: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.materialPrimary.shade800,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black10,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black10,
      ),
      // AppBar
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.black10,
      ),
      // TextField
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.black10,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w400,
      ),
      // Text, NavBarItems
      bodySmall: TextStyle(
        fontSize: 13.sp,
        color: AppColors.black20,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w700,
      ),
      // Button
      labelMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black10,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.black20,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData darkThemeEnglish = ThemeData(
    fontFamily: 'Switzer',
    primaryColor: AppColors.materialPrimary,
    scaffoldBackgroundColor: AppColors.black5,
    splashColor: AppColors.materialPrimary.shade200,
    canvasColor: AppColors.mainGray.shade900,
    iconTheme: const IconThemeData(
      color: AppColors.white10,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.materialPrimary,
      onPrimary: AppColors.materialPrimary,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.white10,
      iconTheme: const IconThemeData(
        color: AppColors.white10,
      ),
      elevation: 2,
      scrolledUnderElevation: 0,
      titleSpacing: 1,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: SystemUiOverlayStyle.dark.systemNavigationBarColor,
        statusBarColor: AppColors.white10,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    indicatorColor: AppColors.primary,
    popupMenuTheme: PopupMenuThemeData(
      color: AppColors.white10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28.sp,
        color: AppColors.materialPrimary.shade800,
      ),
      headlineMedium: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.materialPrimary.shade800,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white10,
      ),
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white10,
      ),
      // AppBar
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.white10,
      ),
      // TextField
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.white10,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w400,
      ),
      // Text, NavBarItems
      bodySmall: TextStyle(
        fontSize: 13.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w700,
      ),
      // Button
      labelMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white10,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

// static ThemeData themeArabic = ThemeData(
//   fontFamily: 'Switzer',
//   primaryColor: AppColors.materialPrimary,
//   scaffoldBackgroundColor: AppColors.white,
//   splashColor: AppColors.materialPrimary.shade200,
//   canvasColor: AppColors.white,
//   iconTheme: const IconThemeData(
//     color: AppColors.black10,
//   ),
//   colorScheme: ColorScheme.fromSwatch(
//     primarySwatch: AppColors.materialPrimary,
//     backgroundColor: AppColors.materialPrimary.shade50,
//   ),
//   appBarTheme: const AppBarTheme(
//     color: AppColors.white,
//     iconTheme: IconThemeData(
//       color: AppColors.black10,
//     ),
//     elevation: 2,
//     scrolledUnderElevation: 0,
//     titleSpacing: 1,
//   ),
//   indicatorColor: AppColors.black10,
//   popupMenuTheme: PopupMenuThemeData(
//     color: AppColors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
//   textTheme: TextTheme(
//     headlineLarge: TextStyle(
//       fontSize: 32.sp,
//       fontWeight: FontWeight.w700,
//       color: AppColors.materialPrimary.shade800,
//     ),
//     headlineMedium: TextStyle(
//       fontSize: 28.sp,
//       fontWeight: FontWeight.w600,
//       color: AppColors.materialPrimary.shade800,
//     ),
//     headlineSmall: TextStyle(
//       fontSize: 26.sp,
//       fontWeight: FontWeight.w700,
//       color: AppColors.primary,
//     ),
//     titleLarge: TextStyle(
//       fontSize: 20.sp,
//       fontWeight: FontWeight.w700,
//       color: AppColors.black10,
//     ),
//     // AppBar
//     titleMedium: TextStyle(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.w700,
//       color: AppColors.black10,
//     ),
//     // TextField
//     titleSmall: TextStyle(
//       fontSize: 16.sp,
//       fontWeight: FontWeight.bold,
//       color: AppColors.materialPrimary.shade700,
//     ),
//     bodyLarge: TextStyle(
//       fontSize: 18.sp,
//       color: AppColors.black10,
//       fontWeight: FontWeight.w700,
//     ),
//     bodyMedium: TextStyle(
//       fontSize: 16.sp,
//       color: AppColors.black10,
//       fontWeight: FontWeight.w700,
//     ),
//     // Text, NavBarItems
//     bodySmall: TextStyle(
//       fontSize: 14.sp,
//       color: AppColors.black10,
//       fontWeight: FontWeight.w700,
//     ),
//     labelLarge: TextStyle(
//       fontSize: 18.sp,
//       color: AppColors.black10,
//       fontWeight: FontWeight.w700,
//     ),
//     // Button
//     labelMedium: TextStyle(
//       fontSize: 16.sp,
//       color: AppColors.black10,
//       fontWeight: FontWeight.w900,
//     ),
//     labelSmall: TextStyle(
//       fontSize: 14.sp,
//       color: AppColors.black10,
//       fontWeight: FontWeight.w700,
//     ),
//   ),
// );
}
