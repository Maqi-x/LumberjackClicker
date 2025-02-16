import 'package:flutter/material.dart';
import 'package:lumberjack_clicker/Utils/all.dart';
import '../../Global.dart';
import 'package:provider/provider.dart';

class SettingsCategory extends StatefulWidget {
  final String title;
  final List<Widget> items;

  const SettingsCategory({
    required this.title,
    required this.items,
    super.key,
  });

  @override
  SettingsCategoryState createState() => SettingsCategoryState();
}

class SettingsCategoryState extends State<SettingsCategory> {
  bool isExpanded = true;
  Key expansionKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    loadExpandedState();
  }

  void loadExpandedState() async {
    bool storedValue = await get<bool>('Data/${widget.title}/expanded', true);
    setState(() {
      isExpanded = storedValue;
      expansionKey = UniqueKey();
    });
  }

  void saveExpandedState(bool expanded) async {
    await save('Data/${widget.title}/expanded', expanded);
  }

  @override
  Widget build(BuildContext context) {
    final global = context.read<GlobalState>();

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          expansionTileTheme: ExpansionTileThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            iconColor: Colors.white60,
            collapsedIconColor: Colors.white38,
            textColor: Colors.white,
            collapsedTextColor: Colors.white70,
            backgroundColor: global.darktheme ? Color.fromARGB(185, 31, 31, 31) : const Color.fromARGB(255, 226, 233, 238),
          ),
        ),
        child: ExpansionTile(
          key: expansionKey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            global.autoVibration(-1);
            saveExpandedState(expanded);
            setState(() {
              isExpanded = expanded;
            });
          },
          children: widget.items,
        ),
      ),
    );
  }
}
