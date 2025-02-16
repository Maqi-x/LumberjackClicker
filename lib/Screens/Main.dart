import 'Clicker.dart';
import 'Settings/Settings.dart';
import 'Shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Global.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late int selectedIndex = 1;

  final List<Widget> widgetOptions = const [
    ShopScreen(),
    ClickerScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    final global = Provider.of<GlobalState>(context, listen: false);

    global.refresh().then((_) {
      setState(() {
        selectedIndex = global.defaultScreen;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalState>(context);

    return Scaffold(
      body: global.animationsSwitch
          ? AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: widgetOptions[selectedIndex],
            )
          : widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.shop),
            label: global.Lang('Sklep', 'Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            label: 'Clicker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: global.Lang('Ustawienia', 'Settings'),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
          global.autoVibration();
        },
      ),
    );
  }
}
