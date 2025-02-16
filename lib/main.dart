import 'Screens/Main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';
import 'Global.dart';

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
    final global = Provider.of<GlobalState>(context);
    global.refresh();

    return MaterialApp(
      title: "Lumberjack clicker",
      theme: global.getTheme(),
      home: const MainScreen(),
    );
  }
}
