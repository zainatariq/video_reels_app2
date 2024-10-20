





import 'package:flutter/cupertino.dart';

class ConText {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? context = ConText.navigatorKey.currentState?.overlay?.context;
}
