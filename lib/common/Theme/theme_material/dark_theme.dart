import 'package:flutter/material.dart';

import '../../AppColors.dart';

class DarkTheme {
  static get darkTheme => _darkTheme;

  static final ThemeData _darkTheme = ThemeData(
    fontFamily: 'SFProText',
    primaryColor: AppColors.  primaryAppColor,
    brightness: Brightness.dark,
    // backgroundColor:AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    listTileTheme:   ListTileThemeData(
      iconColor: AppColors.  primaryColorDark,

    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(color: AppColors.whiteColor),
      displayLarge: TextStyle(color: AppColors.whiteColor),
      displayMedium: TextStyle(color: AppColors.whiteColor),
      displaySmall: TextStyle(color: AppColors.whiteColor),
      headlineMedium: TextStyle(color: AppColors.whiteColor),
      headlineSmall: TextStyle(color: AppColors.whiteColor),
      titleLarge: TextStyle(color: AppColors.whiteColor),
      titleMedium: TextStyle(color: AppColors.whiteColor),
      titleSmall: TextStyle(color: AppColors.whiteColor),
      bodyLarge: TextStyle(color: AppColors.whiteColor),
      bodyMedium: TextStyle(color: AppColors.whiteColor),
      labelLarge: TextStyle(color: AppColors.whiteColor),
      labelSmall: TextStyle(color: AppColors.whiteColor),
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color:   AppColors.validButtonColorDark,

    ),




    // primary: AppColors.primaryAppColor,
    // outline: AppColors.primaryAppColor,
    // secondaryContainer: AppColors.primaryAppColor,
    // tertiaryContainer:AppColors. primaryAppColor, //button color

    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.blackColor,
      outlineVariant: AppColors.validButtonColorDark,
      tertiary: AppColors.validButtonColorDark,

      outline:AppColors.whiteColor,
      scrim: AppColors.greyColor,
      background: AppColors.blackColor,
      onPrimary: AppColors.primaryColorDark,
      onSurface: AppColors.greyColor,
      secondary: AppColors.whiteColor,
      onTertiary: AppColors.primaryColorDark.withOpacity(.7),//not valid button  color
      tertiaryContainer:AppColors. primaryColorDark, //button color
      onBackground: AppColors.blackColor,

      onSecondary: AppColors.whiteColor,
      error: AppColors.redColor,
      surfaceTint: AppColors.bluBlackCoLorDark, //blue  border

     ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryAppColor,

      ),
    ),
    checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(AppColors.primaryColorDark),
        fillColor: MaterialStateProperty.all(AppColors.primaryAppColor),
      ),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.greyColor),
         trackColor: MaterialStateProperty.all(AppColors.greyColor.withOpacity(.4)),

    ),















    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      elevation: 10,
      selectedLabelStyle: TextStyle(
          color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0
      ),
      unselectedLabelStyle: TextStyle(
          color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0
      ),
      selectedItemColor: Color(0xFFA67926),
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: true,
    ),
  );
}