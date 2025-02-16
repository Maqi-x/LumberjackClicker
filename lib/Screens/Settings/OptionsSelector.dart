import '../../Global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

class SettingsOptionSelector extends StatefulWidget {
  final String title;
  final List<String> options;
  final int Function(BuildContext) getValue;
  final void Function(BuildContext, int) setValue;

  const SettingsOptionSelector({
    required this.title,
    required this.options,
    required this.getValue,
    required this.setValue,
    super.key,
  });

  @override
  SettingsOptionSelectorState createState() => SettingsOptionSelectorState();
}

class SettingsOptionSelectorState extends State<SettingsOptionSelector> {
  late int selectedIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedIndex = widget.getValue(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: List.generate(
                  (widget.options.length / 2).ceil(),
                  (rowIndex) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(2, (colIndex) {
                        int index = rowIndex * 2 + colIndex;
                        if (index >= widget.options.length) return SizedBox();
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                            child: ChoiceChip(
                              label: Center(child: Text(widget.options[index])),
                              selected: selectedIndex == index,
                              onSelected: (selected) {
                                setState(
                                  () {
                                    log(index.toString());
                                    selectedIndex = index;
                                    widget.setValue(context, index);
                                    context.read<GlobalState>().autoVibration();
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
