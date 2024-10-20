
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/locale_keys.g.dart';
import 'app_strings.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;
  // final String message;
  final void Function() resetState;

  const ErrorDialog({
    super.key,
    required this.title,
    required this.message,
    required this.resetState,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      content: Text(
        ///Zeinab  Back translation
        message,
        // message.tr(context: context),
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: resetState,
          child: Text(LocaleKeys.resend_it,
            style: const TextStyle(color: Colors.white),

            ///Zeinab  Back translation
            // 'close'.tr(context: context),
          ),
        ),
      ],
    );
  }
}

class EmptyDialog extends StatelessWidget {
  const EmptyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment:  Alignment.center,
      title: Center(child: Text(LocaleKeys.noData.tr())),
      content: Text(' '),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeCubitCubit cubit = ThemeCubitCubit.get_address(context);
    return const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.red,
        ),
        // child: Image.asset(
        // cubit.isLightTheme
        //     ? Assets.imagesGifsLoadingGif
        //     : Assets.imagesGifsLoadingGif1,
        // ),
      ),
    );
  }
}
