import 'package:flutter/material.dart';

void showOneContextAlertDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      );
    },
  );
}

void showOneContextSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(

    SnackBar(
      content: Text(text),
      duration: const Duration(milliseconds: 100),
    ),
  );
}
