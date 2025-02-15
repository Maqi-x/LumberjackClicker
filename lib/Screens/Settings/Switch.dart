import 'package:flutter/material.dart';
import 'package:lumberjack_clicker/utils.dart';
import '../../GLOBAL.dart';
import 'package:provider/provider.dart';

class SettingsSwitch extends StatelessWidget {
  final String title;
  final String description;
  final bool Function(BuildContext) getValue;
  final void Function(BuildContext, bool) setValue;

  const SettingsSwitch({
    required this.title,
    required this.description,
    required this.getValue,
    required this.setValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalState>(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: getValue(context),
              onChanged: (newValue) {
                setValue(context, newValue);
                if (global.vibrationSwitch) mediumVibration();
              },
            ),
          ],
        ),
      ),
    );
  }
}
