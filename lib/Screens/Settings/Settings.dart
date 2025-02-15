import 'package:flutter/material.dart';
import 'package:lumberjack_clicker/utils.dart';
import '../../GLOBAL.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
// import 'dart:io';

// ------- Widgets ------- \\

import 'Switch.dart';
import 'Buttons.dart';
import 'OptionsSelector.dart';

import '../../Widgets/MarkdownTextView.dart';

// ----------------------- \\

void showRestartDialog(BuildContext context, {void Function()? action}) {
  final global = context.read<GlobalState>();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Info"),
      content: Text(global.lang == 0
          ? "Aby zmiany zostały poprawnie zastosowane będziesz musiał zrestartować aplikacje"
          : "In order for the changes to be applied correctly you will need to restart the app"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Anuluj"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            global.autoVibration();
            if (action != null) {
              action();
            }
            Phoenix.rebirth(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: Text("Ok"),
        ),
      ],
    ),
  );
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final global = context.read<GlobalState>();
    return Scaffold(
      appBar: AppBar(title: Text('Ustawienia')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SettingsCategory(
            title: global.Lang("Wibracje", "Vibrations"),
            items: [
              SettingsSwitch(
                title: global.Lang("Wibracje", "Vibrations"),
                description: global.lang == 0
                    ? "Doświadczaj lepszych doznań z gry dzieki wibracjom (działa tylko na telefonach)"
                    : "Experience a better gaming experience with vibrations (works only on phones)",
                getValue: (context) => global.vibrationSwitch,
                setValue: (context, value) => global.vibrationSwitch = value,
              ),
              SettingsOptionSelector(
                title: global.Lang("Moc wibracji", "Vibrations power"),
                options: [
                  global.lang == 0 ? "Lekkie" : "Light",
                  global.lang == 0 ? "Średnie" : "Medium",
                  global.lang == 0 ? "Mocne" : "Havey",
                  "Combo"
                ],
                getValue: (context) => global.vibrationsPower,
                setValue: (context, value) => global.vibrationsPower = value,
              ),
              SettingsButton(
                title: global.Lang("Testuj wibracje", "Test vibrations"),
                onPressed: () {
                  global.autoVibration();
                },
              )
            ],
          ),
          SettingsCategory(
            title: global.Lang("Wygląd", "Appearance"),
            items: [
              SettingsSwitch(
                title: global.Lang("Ciemny motyw", "Dark theme"),
                description: global.Lang("Włącza ciemny motyw", "Enables dark theme"),
                getValue: (context) => global.darktheme,
                setValue: (context, value) {
                  showRestartDialog(context, action: () => global.darktheme = value);
                },
              ),
              SettingsSwitch(
                title: global.lang == 0 ? "Animacje" : "Animations",
                description: global.Lang("Lepsze efekty graficzne dzięki animacjom", "Better graphic effects with animations"),
                getValue: (context) => global.animationsSwitch,
                setValue: (context, value) => global.animationsSwitch = value,
              ),
            ],
          ),
          SettingsCategory(title: global.Lang("Inne", "Other"), items: [
            SettingsOptionSelector(
                title: global.Lang("Domyślny ekran", "Default screen"),
                options: [global.Lang("Sklep", "Shop"), global.Lang("Ustawienia", "Settings"), "Clicker"],
                getValue: (context) {
                  return switch (global.defaultScreen) {
                    0 => 0,
                    2 => 1,
                    _ => 2,
                  };
                },
                setValue: (context, value) {
                  global.defaultScreen = switch (value) {
                    0 => 0,
                    1 => 2,
                    _ => 1,
                  };
                }),
            SettingsOptionSelector(
                title: global.Lang("Język", "Language"),
                options: ["Polski", "English"],
                getValue: (context) => global.lang,
                setValue: (context, value) {
                  global.lang = value;
                  showRestartDialog(context);
                })
          ]),
          SettingsCategory(
            title: global.lang == 0 ? "Zaawansowane" : "Advanced",
            items: [
              SettingsDangerButton(
                title: global.Lang("Resetuj dane", "Reset data"),
                onPressed: () {
                  delAll();
                  final global = Provider.of<GlobalState>(context, listen: false);
                  global.refresh();
                },
                desc: global.lang == 0
                    ? "\nUwaga! to nieodwracalnie wyczyści wszytskie ustawienia oraz postęp gry! tego NIE DA SIĘ PRZYWRÓCIĆ!\nZastosowanie zmian może wymagać ponownego uruchomienia gry"
                    : "Warning! this will irreversibly clear all settings and game progress! this can NOT be restored! Applying the changes may require restarting the game",
              ),
            ],
          ),
          MarkdownTextView(
            text: global.lang == 0
                ? """
# **Info**
**Lumberjack clicker** to prosta gra typu clicker, polegająca na zcinaniu drewna, sprzedaży i kupowaniu ulepszeń.\n
Aktualnie w fazie **Beta**\n
Projekt *jest open source!*, jeśli chcesz przejżeć kod źródłowy sprawdź naszego [githuba](github.com)
            """
                : """# **Info**.
**Lumberjack clicker** is a simple clicker game of cutting wood, selling and buying upgrades.\n
Currently in **Beta** phase\n
Project *is open source!* if you want to browse the source code check out our [github](github.com)\n""",
          )
        ],
      ),
    );
  }
}

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
