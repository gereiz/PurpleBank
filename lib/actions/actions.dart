import 'package:flutter/material.dart';

Future erro(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 2000));
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: const Text('Erro'),
        content: const Text(
            'Erro ao acessar. Por favor, verifique a sua conexão ou atualize seu aplicativo.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
  await Future.delayed(const Duration(milliseconds: 1000));
}
