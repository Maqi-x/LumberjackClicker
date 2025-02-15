import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../GLOBAL.dart';
import 'dart:async';
import '../utils.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  static bool sellLocked = false;
  void sellAnimation(BuildContext context, {int duration = 5}) {
    if (sellLocked) return;
    sellLocked = true;

    final global = Provider.of<GlobalState>(context, listen: false);
    final startLogs = global.logs;
    final moneyToAdd = startLogs * 10;

    final startTime = DateTime.now().millisecondsSinceEpoch;
    final endTime = startTime + (duration * 1000);

    int logsSold = 0;
    int moneyAdded = 0;

    void updateValues() {
      final now = DateTime.now().millisecondsSinceEpoch;
      final progress = ((now - startTime) / (endTime - startTime)).clamp(0.0, 1.0);

      if (progress < 1.0) {
        final targetLogsSold = (startLogs * progress).round();
        final targetMoneyAdded = (moneyToAdd * progress).round();

        final newLogsSold = targetLogsSold - logsSold;
        final newMoneyAdded = targetMoneyAdded - moneyAdded;

        global.logs -= newLogsSold;
        global.money += newMoneyAdded;

        logsSold += newLogsSold;
        moneyAdded += newMoneyAdded;

        Timer(Duration(milliseconds: 16), updateValues);
      } else {
        final remainingLogs = startLogs - logsSold;
        final remainingMoney = moneyToAdd - moneyAdded;

        global.logs -= remainingLogs;
        global.money += remainingMoney;

        sellLocked = false;
      }
    }

    updateValues();
    lightVibration();
  }

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalState>(context);
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        children: [
          if (MediaQuery.of(context).size.width < 600) const SizedBox(height: 20),
          genStatsPanel(global),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // TODO: items
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromARGB(0, 0, 0, 0),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 30,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    sellAnimation(context, duration: randDouble(1.5, 3).toInt());
                  },
                  child: const Text(
                    'Sprzedaj',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
