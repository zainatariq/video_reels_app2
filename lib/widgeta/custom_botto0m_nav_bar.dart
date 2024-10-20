import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/app_consts.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.bottomNavBarData,
  });

  void Function(int)? onTap;
  final int currentIndex;
  final List bottomNavBarData;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      backgroundColor:Colors.white,
      elevation: 3,
      unselectedIconTheme: IconThemeData(color: Theme.of(context).textTheme.bodySmall?.color!.withOpacity(.5)),
      selectedIconTheme:   IconThemeData(color: Theme.of(context).textTheme.bodySmall?.color),
      unselectedLabelStyle: TextStyle(color:Theme.of( context). textTheme.bodySmall?.color?.withOpacity(.5),fontSize: 12.sp),
      selectedLabelStyle:   TextStyle(color: Theme.of(context).textTheme.bodySmall?.color,fontSize: 12.sp),
      fixedColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,

      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        for (int i = 0; i < bottomNavBarData.length; i++)
          BottomNavigationBarItem(
            icon: Image.asset(
              bottomNavBarData[i]['icon'],
              height: 25.h,
              fit: BoxFit.contain,
            ),
            label: bottomNavBarData[i]['label'],

            activeIcon: Image.asset(
              bottomNavBarData[i]['active'],
              height: 25.h, fit: BoxFit.contain,
              color: Theme.of(context).primaryColor,
            ),
          ),
      ],
    );
  }
}
