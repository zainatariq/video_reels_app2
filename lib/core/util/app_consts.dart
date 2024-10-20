
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/AppColors.dart';
import '../../widgeta/contex.dart';

BuildContext? context = ConText.navigatorKey.currentState?.overlay?.context;


class K{
  static SizedBox sizedBoxH20 = SizedBox(height: 20.h);
  static SizedBox sizedBoxH10 = SizedBox(height: 10.h);

  static SizedBox sizedBoxW20 = SizedBox(width: 20.h);
  static SizedBox sizedBoxW10 = SizedBox(width: 10.h);

  static TextStyle blackLargeBoldTextStyle = TextStyle(
    color:  Theme.of( context!).colorScheme.onPrimary,
    fontSize: 24.sp,
    fontWeight: FontWeight.w900,
  );
  static TextStyle blackAnWhiteLargeSemiBoldTextStyle({BuildContext ? contextt}) {
    contextt==null?context=context:context=contextt;

    return TextStyle(
      color:  Theme.of(context!).colorScheme.outline,
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    );
  }
  static final boxDecorationLightGrey= BoxDecoration(
    color: AppColors.blackColor,
    borderRadius: BorderRadius.circular(10.0), // set border radius
    border: Border.all(
      color: AppColors.whiteColor,
      width: 2.0, // set border width
    ),
  );

   static final fixedWhiteBoxDecoration= BoxDecoration(
     borderRadius: BorderRadius.circular(15.0),
     border: Border.all(
         color: Colors.grey.shade300, style: BorderStyle.solid, width: 0.80),
   );


 static final profileCardsBoxDecoration= BoxDecoration(
   borderRadius: BorderRadius.all(Radius.circular(12.r)),
   color: Colors.white,
   boxShadow: [
     BoxShadow(
       color: Colors.grey.withOpacity(.2),
       offset: const Offset(1, 4),
       blurRadius: 6.0,
       spreadRadius: 002.0,
     ),
   ],
 );




  static TextStyle blackLabelSemiBoldTextStyle ({BuildContext ? contextt}) {
    contextt == null ? context = context : context = contextt;

    return TextStyle(
      color: Theme
          .of(context!)
          .colorScheme
          .outline,
      // color: Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    );
  }
  static final boxDecorationPrimaryBg= BoxDecoration(
    color:Theme
        .of(context!)
        .colorScheme
        .primary,
    border: Border.all(color: AppColors.grey,width: 1),
    borderRadius: BorderRadius.circular(10),
  );
  static TextStyle blackMeduimBoldTextStyle({BuildContext ? contextt}) {
    contextt==null?context=context:context=contextt;

    return TextStyle(
      color: Theme.of( context!). textTheme.bodySmall?.color,
         fontSize: 20.sp,
        fontWeight: FontWeight.bold,
    );
  }


  static TextStyle blackSmallRegularTextStyle({BuildContext ? contextt}) {
    contextt == null ? context = context : context = contextt;

    return TextStyle(
      color:
      Theme
          .of(context!)
          .colorScheme
          .outline,
      // Theme.of( context!). textTheme.bodySmall?.color,

      // color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }static TextStyle blackSmallBoldTextStyle = TextStyle(
    color: Theme.of( context!). textTheme.bodySmall?.color,
    // color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle whiteSmallTextField = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle whiteExtraSmallTextField = TextStyle(
    color: Colors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  ); static TextStyle blackExtraSmallTextField = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );



  static TextStyle whiteXSmallTextField = TextStyle(
    color: Colors.white,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );



  static TextStyle greyCardTextStyle =  TextStyle(
      color: AppColors.grey,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500
  );

  static TextStyle greyMediumCardTextStyle =  TextStyle(
      color: AppColors.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500
  );  static TextStyle greySmallCardTextStyle =  TextStyle(
      color: AppColors.grey,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500
  );
  // static TextStyle blackSmallCardTextStyle =  TextStyle(//...
  //     color: Theme.of( context!). textTheme.bodySmall?.color,
  //
  //     // color: AppColors.blackColor,
  //     fontSize: 12.sp,
  //     fontWeight: FontWeight.w500
  // );
  //
  static TextStyle blackSmallCardTextStyle({BuildContext ? contextt}) {
    contextt==null?context=context:context=contextt;

    return TextStyle(
      color: Theme.of( context!). textTheme.bodySmall?.color,
      //
          // color: AppColors.blackColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500
    );
  }
  ///....change this ni drak mode color
  static TextStyle blackSmallRegularCardTextStyle   ({BuildContext ? contextt}) {
    contextt == null ? context = context : context = contextt;

    return TextStyle(
        color: Theme
            .of(context!)
            .textTheme
            .bodySmall
            ?.color,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400
    );
  }


  static TextStyle blackextraSmallCardTextStyle =  TextStyle(
      color: Theme.of( context!). textTheme.bodySmall?.color,

      fontSize: 10.sp,
      fontWeight: FontWeight.w400
  );


  static TextStyle greyMeduimCardTextStyle =  TextStyle(
      color: AppColors.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500
  );


  static TextStyle yellowCardTextStyle =  TextStyle(
      color: AppColors.yellow,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500
  );

  static TextStyle babyGreenCardTextStyle =  TextStyle(
      color: AppColors.green,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500
  );
  static TextStyle redCardTextStyle =  TextStyle(
      color: AppColors.navyRedColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500
  );



  static TextStyle blackCardTextStyle = TextStyle(
    color: Theme.of( context!). textTheme.bodySmall?.color,
    // color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );


  static TextStyle blackCardBoldTextStyle = TextStyle(
    // color: Theme.of( context!). textTheme.bodySmall?.color,

    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final leftRaduis= BoxDecoration(
    color: AppColors.primaryAppColor.withOpacity(.5),
    border: Border.all(color: AppColors.primaryAppColor,width: 1),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        bottomLeft: Radius.circular(10.r)),
  );

  static TextStyle selectedTextStyle = TextStyle(
    color:   const Color(
      0xFF3264BC
    ),
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: Colors.grey.shade200,
      width: 2.0,
    ),
  );

  static BoxDecoration whiteBoxDecoration   ({BuildContext ? contextt}) {
    contextt == null ? context = context : context = contextt;

    return BoxDecoration(
      color: Theme
          .of(context!)
          .colorScheme
          .outlineVariant,
      // color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.007),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(1, -1),
        ),
      ],
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent
      ),
    );
  }

  // static BoxDecoration whiteBoxDecorationWithBorder = BoxDecoration(
  //   color:   Theme.of( context!). colorScheme.outlineVariant,
  //
  //   borderRadius: BorderRadius.circular(12),
  //   boxShadow: [
  //     BoxShadow(
  //       color: Colors.grey.withOpacity(0.2),
  //       spreadRadius: 1,
  //       blurRadius: 2,
  //       offset: Offset(0, 1),
  //     ),
  //   ],
  // );

  static BoxDecoration whiteBoxDecorationWithBorder({BuildContext ? contextt}) {
    contextt==null?context=context:context=contextt;

  return BoxDecoration(
    color:   Theme.of( context!). colorScheme.outlineVariant,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
    offset: Offset(0, 1),
    ),
    ],
    );
    }


    static BoxDecoration whiteBoxDecorationWithShadow = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(.007),
        spreadRadius: 1,
        blurRadius: 4,
        offset: const Offset(1, -1),
      ),
    ],
    borderRadius: BorderRadius.circular(12.r),
    border: Border.all(color: Colors.grey.shade300
      // color: Colors.grey.shade300,

    ),
  );




static String get baseUrl => '----';
  // static  String get mapKey =>dotenv.get("map_Key");
  // static String get paymentApiKey => dotenv.get("paymentApiKey");
  // static String get appId => dotenv.get("app_id");
  // static String get region => dotenv.get("region");
  // static String get authKey => dotenv.get("auth_key");
  // static String get apiKey => dotenv.get("api_key");

}