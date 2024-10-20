import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'common/AppColors.dart';
import 'common/main_app/biapp.dart';
import 'common/main_app/screen_util.dart';
import 'helper/Observer/app_bloc_observer.dart';
 import 'injection_contanier.dart';
import 'localization/localization_widget.dart';

bool isJustUiTest = false;
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=>true;
  }
}
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalizationWidget.setUp();
  // await dotenv.load(fileName: ".env");
  await init();


  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(  statusBarColor:AppColors.primaryAppColor));
  if (!kIsWeb) {
    HttpOverrides.global = MyHttpOverrides();
  }
  Bloc.observer = AppBlocObserver();

  // await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
  // FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  runApp(
      const LocalizationWidget(
        child: ScreenUtilInitWidget(
          child: VideosApp(),
        ),
      )
  );
}

