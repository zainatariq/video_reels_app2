import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../core/util/validator.dart';
// import '../generated/codegen_loader.g.dart';
import '../generated/codegen_loader.g.dart';
import 'change_language.dart';

import 'cubit/localization_cubit.dart';
import 'cubit/localization_state.dart';

class LocalizationWidget extends StatelessWidget {
  final Widget child;
  const LocalizationWidget({super.key, required this.child});

  static Future<void> setUp() async {
    EasyLocalization.logger.enableLevels = [
      LevelMessages.error,
      LevelMessages.warning
    ];
    await EasyLocalization.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationCubit(),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return EasyLocalization(
            supportedLocales: [Locale(Lang.en.name), Locale(Lang.ar.name)],
            path: 'assets/translations/',
            startLocale: Locale(Lang.en.name),
            fallbackLocale: Locale(Lang.en.name),
            assetLoader: _loadCodegenLoader(),
            child: child,
          );
        },
      ),
    );
  }

  CodegenLoader _loadCodegenLoader() {
    // CodegenLoader.ar.addAll(TValidator.arV);
    // CodegenLoader.en.addAll(TValidator.enV);
    return const CodegenLoader();
  }
}
