import 'package:flutter/material.dart';

Future<void> showTextDialog(BuildContext context, String message) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          message,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

/// はいを選ぶとtrue、いいえや選ばず戻ったときはfalseを返す
Future<bool> showConfirmDialog(context, message) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: const Text('はい'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              TextButton(
                child: const Text('いいえ'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ],
          );
        },
      ) ??
      false;
}
