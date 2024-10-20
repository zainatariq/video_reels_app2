



import 'package:flutter/cupertino.dart';

class NavigationHelper {
  static void navigateAfterBuild(
      BuildContext context, String routeName, {Object? arguments}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
    });
  }
  static void navigateTo(BuildContext context, String routeName, {Object? arguments}) {

    Navigator.pushNamed(context, routeName, arguments: arguments);
  }
  static void navigatePop(BuildContext context, {  bool ?result}) {
    Navigator.pop(context, result);
  }
}