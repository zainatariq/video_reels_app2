import 'package:flutter/material.dart';

import '../../AppColors.dart';

//
//
// class AppTheme {
//   static get appTheme => _lightTheme;
//   static final ThemeData _lightTheme = ThemeData(
//     fontFamily: 'SFProText',
//      primaryColor: AppColors.primaryAppColor,
//     brightness: Brightness.light,
//     hintColor: const Color(0xFF9F9F9F),
//     textTheme: TextTheme(
//       bodyText1: TextStyle(color: AppColors.blackColor),
//       bodyText2: TextStyle(color: AppColors.blackColor),
//       bodySmall: TextStyle(color: AppColors.blackColor),
//       button: TextStyle(color: AppColors.primaryAppColor),
//       headline1: TextStyle(color: AppColors.blackColor),
//       headline2: TextStyle(color: AppColors.blackColor),
//       headline3: TextStyle(color: AppColors.blackColor),
//       headline4: TextStyle(color: AppColors.blackColor),
//       headline5: TextStyle(color: AppColors.blackColor),
//       headline6: TextStyle(color: AppColors.blackColor),
//       subtitle1: TextStyle(color: AppColors.blackColor),
//       subtitle2: TextStyle(color: AppColors.blackColor),
//       caption: TextStyle(color: AppColors.blackColor),
//       overline: TextStyle(color: AppColors.blackColor),
//         displayLarge : TextStyle(color: AppColors.blackColor),
//         displayMedium : TextStyle(color: AppColors.blackColor),
//         displaySmall : TextStyle(color: AppColors.blackColor),
//         headlineMedium: TextStyle(color: AppColors.blackColor),
//         headlineSmall : TextStyle(color: AppColors.blackColor),
//         titleLarge : TextStyle(color: AppColors.blackColor),
//         titleMedium: TextStyle(color: AppColors.blackColor),
//         titleSmall : TextStyle(color: AppColors.blackColor),
//         bodyLarge : TextStyle(color: AppColors.blackColor),
//         bodyMedium : TextStyle(color: AppColors.blackColor),
//          labelLarge : TextStyle(color: AppColors.blackColor),
//         labelSmall : TextStyle(color: AppColors.blackColor),
//     ),
//     textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(foregroundColor: AppColors.primaryAppColor,)),
//     checkboxTheme: CheckboxThemeData(
//         checkColor: MaterialStateProperty.all(AppColors.primaryColorDark),
//         fillColor: MaterialStateProperty.all(AppColors.whiteColor),
//         side: BorderSide(color: AppColors.grey, width: 1.0),
//         overlayColor: MaterialStateProperty.all(AppColors.primaryColorDark),
//       ),
//     dividerColor: AppColors.greyColor.withOpacity(.7),
//     colorScheme: ColorScheme.light(
//       primary: AppColors.primaryAppColor,
//       outline:AppColors.primaryAppColor,
//       secondaryContainer:AppColors.primaryAppColor,
//       outlineVariant: AppColors.whiteColor,
//       onPrimary: AppColors.blackColor,
//       onSurface: AppColors.primaryAppColor,
//       secondary: AppColors.primaryColorDark,//      onSecondary:  Theme.of(Get.context!).colorScheme.secondaryContainer,
//       scrim: AppColors.primaryColorDark,
//       error: AppColors.redColor,
//       background:  AppColors.whiteColor,
//       tertiary: AppColors.primaryAppColor,
//       tertiaryContainer: const Color(0xFFC98B3E),
//       onTertiary: const Color(0xFFD9D9D9),
//       // onSecondary: Color(0xFF00FEE1),
//       onSecondaryContainer: const Color(0xFFA8C5C1),
//       onTertiaryContainer: const Color(0xFF425956),
//       // outline: Color(0xFF8CFFF1),
//
//       onPrimaryContainer: const Color(0xFFDEFFFB),
//       primaryContainer: const Color(0xFFFFA800),
//     ).copyWith(background: AppColors.bg,),
//
//
//
//
//
//   );
// }
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get appTheme => _lightTheme;

  static final ThemeData _lightTheme = ThemeData(
  fontFamily: 'SFProText',
  primaryColor: AppColors.primaryAppColor,
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  textTheme: TextTheme(
  bodySmall: TextStyle(color: AppColors.blackColor),
  displayLarge: TextStyle(color: AppColors.blackColor),
  displayMedium: TextStyle(color: AppColors.blackColor),
  displaySmall: TextStyle(color: AppColors.blackColor),
  headlineMedium: TextStyle(color: AppColors.blackColor),
  headlineSmall: TextStyle(color: AppColors.blackColor),
  titleLarge: TextStyle(color: AppColors.blackColor),
  titleMedium: TextStyle(color: AppColors.blackColor),
  titleSmall: TextStyle(color: AppColors.blackColor),
  bodyLarge: TextStyle(color: AppColors.blackColor),
  bodyMedium: TextStyle(color: AppColors.blackColor),
  labelLarge: TextStyle(color: AppColors.blackColor),
  labelSmall: TextStyle(color: AppColors.blackColor),
  ),
  textButtonTheme: TextButtonThemeData(
  style: TextButton.styleFrom(foregroundColor: AppColors.primaryAppColor),
  ),
    bottomAppBarTheme: BottomAppBarTheme(
      color:  AppColors.whiteColor,

    ),
  checkboxTheme: CheckboxThemeData(
  checkColor: MaterialStateProperty.all(AppColors.primaryColorDark),
  fillColor: MaterialStateProperty.all(AppColors.whiteColor),
  side: BorderSide(color: AppColors.grey, width: 1.0),
  overlayColor: MaterialStateProperty.all(AppColors.primaryColorDark),
  ),
    iconTheme: IconThemeData(
      color: AppColors.blackColor,
    ),
    listTileTheme: const ListTileThemeData(
     ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.blackColor),
      trackColor: MaterialStateProperty.all(AppColors.whiteColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      elevation: 10,
      selectedLabelStyle: const TextStyle(
          color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0
      ),
      unselectedLabelStyle: TextStyle(
          color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0
      ),
      selectedItemColor: const Color(0xFFA67926),
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: true,
    ),
    dividerColor: AppColors.greyColor.withOpacity(.7),
    colorScheme: ColorScheme.light(
      surface:AppColors.greyColor.withOpacity(.7),
      primary: AppColors.primaryAppColor,
      outline: AppColors.primaryAppColor,
      secondaryContainer: AppColors.primaryAppColor,
      tertiaryContainer:AppColors. primaryAppColor,
      outlineVariant: AppColors.whiteColor,
      onPrimary: AppColors.blackColor,
      onSurface: AppColors.blackColor,
      scrim: AppColors.primaryColorDark, //---
      tertiary: AppColors.primaryColorDark, //---
      onTertiary:  AppColors.greyColor.withOpacity(.7),//not valid button  color


      secondary: AppColors.primaryColorDark,//----
      error: AppColors.redColor,
      background: AppColors.whiteColor,
      onSecondaryContainer: const Color(0xFFA8C5C1),
      onTertiaryContainer: const Color(0xFF425956),
      onPrimaryContainer: const Color(0xFFDEFFFB),
      primaryContainer: const Color(0xFFFFA800),
      surfaceTint: AppColors.greyColor, //blue  border

    ).copyWith(background: AppColors.bg),



    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue, // Light theme button color
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(

          foregroundColor: AppColors.blackColor,
      ),
    ),
  );


















}
