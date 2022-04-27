import 'package:flutter/material.dart';

void snackErrors(String error, BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('خطایی رخ داد!'),
      content: Text(error),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('باشه'))
      ],
    ),
  );
}
