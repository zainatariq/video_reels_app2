
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_reels_app/common/Theme/theme_bloc/theme_event.dart';
import '../../../injection_contanier.dart';
import '../theme_material/dark_theme.dart';
import '../theme_material/light_theme.dart';
 class ThemeState {
  final bool isDarkMode;
  final ThemeData themeData;

  ThemeState({required this.isDarkMode, required this.themeData});
}


class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
      ThemeState(isDarkMode: true, themeData: AppTheme.appTheme)
  ){
    print('isDarkMode ${state.isDarkMode}');
    getThemeFromLocal();

  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ToggleThemeEvent) {
      yield* _mapToggleThemeEventToState();
    } else if (event is LoadThemeEvent) {
      yield* _mapLoadCurrentThemeEventToState();
    } else if (event is ThemeChangedEvent) {
      // Handle ThemeChangedEvent here if needed

    }
  }

  Stream<ThemeState> _mapToggleThemeEventToState() async* {
     final currentState = state;
    print('savedThemeMode $currentState');
     final newIsDarkMode = !currentState.isDarkMode;

     await saveCurrentTheme(newIsDarkMode);

     final newThemeData = newIsDarkMode ? DarkTheme.darkTheme : AppTheme.appTheme;

     yield ThemeState(isDarkMode: newIsDarkMode, themeData: newThemeData);

    sl<ThemeBloc>().add(ThemeChangedEvent(newThemeData));
  }

  Stream<ThemeState> _mapLoadCurrentThemeEventToState() async* {
    yield ThemeState(isDarkMode: true, themeData: ThemeData(), );
  }

  saveCurrentTheme(bool isDarkMode) async {
    // await CacheHelper.setValue(
    //   kay:  'theme',
    //   value: isDarkMode ? ThemeMode.dark.index.toDouble()  : ThemeMode.light.index.toDouble(),
    // );
    await getThemeFromLocal();
  }

  getThemeFromLocal() async {
    // if (state == null) {
    //   emit(ThemeState(isDarkMode: true, themeData: AppTheme.appTheme));
    // }
    //
    // var savedThemeMode = await CacheHelper.getValue(kay:  'theme');
    //
    //  var isDarkMode = savedThemeMode == ThemeMode.dark.index.toDouble();
    //
    //  emit(ThemeState(isDarkMode: isDarkMode, themeData: state.themeData));
    //
    // print('isDarkMode ${state.isDarkMode}'); // Now it should reflect the correct value
    // return savedThemeMode;
    //

 }
  static get (context) => BlocProvider.of<ThemeBloc>(context).getThemeFromLocal();
}



