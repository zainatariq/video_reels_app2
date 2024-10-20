import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showDialogBox(BuildContext context, {void Function()? onRetry}) async {
  await showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () async {
            Navigator.pop(context); // Close the dialog

            var connectivityResult = await Connectivity().checkConnectivity();
            if (connectivityResult == ConnectivityResult.none) {
              showDialogBox(context, onRetry: onRetry);
            } else {
              if (onRetry != null) {
                onRetry(); // Trigger the retry logic
              }
              if (connectivityResult == ConnectivityResult.mobile) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Connected to mobile network')),
                );
              } else if (connectivityResult == ConnectivityResult.wifi) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Connected to WiFi')),
                );
              }
            }
          },
        ),
      ],
    ),
  );
}
