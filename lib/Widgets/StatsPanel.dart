import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lumberjack_clicker/Global.dart';

Container genStatsPanel(GlobalState global) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: global.darktheme ? Colors.grey[900] : Colors.white70,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          blurRadius: 8,
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        global.buildStat("Logs", global.logs, FontAwesomeIcons.tree),
        global.buildStat("Money", global.money, FontAwesomeIcons.moneyBill),
      ],
    ),
  );
}
