import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'GLOBAL.dart';
import 'Screens/Shop.dart';
import 'Screens/Clicker.dart';
import 'Screens/Settings/Settings.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(
    Phoenix(
      child: ChangeNotifierProvider(
        create: (context) => GlobalState(),
        child: const Game(),
      ),
    ),
  );
}

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    // ------------------- DARK THEME ------------------------- //
    var darkTheme = ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      cardTheme: CardTheme(
        color: Color.fromARGB(97, 0, 0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(193, 0, 1, 8),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white70),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(255, 23, 99, 161);
          }
          return Colors.grey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.blue;
          }
          return Colors.grey.shade800;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(255, 39, 99, 204);
          }
          return Colors.grey;
        }),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        contentTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey[300],
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF2196F3),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color.fromARGB(150, 66, 66, 66),
        selectedColor: Colors.blue,
        disabledColor: const Color.fromARGB(97, 117, 117, 117),
        secondarySelectedColor: Colors.blue.shade700,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        secondaryLabelStyle: const TextStyle(
          color: Colors.white70,
        ),
        brightness: Brightness.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );

    // ------------------- LIGHT THEME --------------------- //
    var lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      cardTheme: CardTheme(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black87),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(255, 23, 99, 161);
          }
          return Colors.grey.shade300;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.blue.shade200;
          }
          return Colors.grey.shade400;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const Color.fromARGB(255, 39, 99, 204);
          }
          return Colors.grey.shade300;
        }),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        contentTextStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey[800],
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF2196F3),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color.fromARGB(150, 240, 240, 240),
        selectedColor: Colors.blue.shade200,
        disabledColor: const Color.fromARGB(97, 200, 200, 200),
        secondarySelectedColor: Colors.blue.shade300,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
        secondaryLabelStyle: const TextStyle(
          color: Colors.black54,
        ),
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );

    // ---------------------------------------------------- //

    final global = Provider.of<GlobalState>(context);
    global.refresh();

    return MaterialApp(
      title: "Lumberjack clicker",
      theme: global.darktheme ? darkTheme : lightTheme,
      home: const MainScreen(),
    );
  }
}

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
