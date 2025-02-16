import '../../Global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SettingsButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

void showConfirmationDialog(BuildContext context, VoidCallback onConfirm, String desc) {
  final global = context.read<GlobalState>();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Potwierdzenie"),
      content: Text(global.Lang("Czy na pewno chcesz to zrobić? $desc", "Do you really want to do it? $desc")),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(global.Lang("Anuluj", "Cancel")),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
            global.autoVibration();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          child: Text("Tak"),
        ),
      ],
    ),
  );
}

class SettingsDangerButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String desc;

  const SettingsDangerButton({
    required this.title,
    required this.onPressed,
    required this.desc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => showConfirmationDialog(context, onPressed, desc),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        child: Text(title),
      ),
    );
  }
}
