 import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../route/route_pages.dart';
import '../../widgeta/contex.dart';
import '../Theme/theme_bloc/theme_bloc.dart';
import '../Theme/theme_material/dark_theme.dart';
import 'multi_provider_widget.dart';

class VideosApp extends StatelessWidget {
  const VideosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProviderWidget(
      view: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) =>

        MaterialApp(
          theme: themeState.themeData,
          darkTheme: DarkTheme.darkTheme,
           debugShowCheckedModeBanner: false,
          themeMode:
          themeState.isDarkMode ?
          ThemeMode.dark
              :
          ThemeMode.light
          ,
          navigatorObservers:
          const [
           ],
           localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: ConText.navigatorKey,
          onGenerateRoute: AppRouteManger.onGenerateRoutes,
          initialRoute: AppRouteManger.initial,
          builder: (context, child) {
            return Scaffold(
              body: child,
            );
          },
        ),
      ),
      // ),

    );
  }
}








