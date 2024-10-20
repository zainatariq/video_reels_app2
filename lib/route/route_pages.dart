import 'dart:convert';
import 'package:flutter/material.dart';
import '../featurs/video_screen/presentation/pages/video_screen.dart';

import 'paths.dart';

class AppRouteManger {
  static String get initial {
      return AppPaths.getVideos;
   }

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppPaths.getVideos:
        return MaterialPageRoute(
            builder: ((context) => const GetVideosScreen()));


      default:
        return _materialRoute(const Scaffold());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) =>   view);
    // return MaterialPageRoute(builder: (_) => ChuckerFlutterPage(child: view));
  }
}
