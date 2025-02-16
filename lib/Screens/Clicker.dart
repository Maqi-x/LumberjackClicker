import '../Global.dart';
import '../Utils/all.dart';
import '../Widgets/StatsPanel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class ClickerScreen extends StatefulWidget {
  const ClickerScreen({super.key});

  @override
  _ClickerScreenState createState() => _ClickerScreenState();
}

class _ClickerScreenState extends State<ClickerScreen> with TickerProviderStateMixin {
  late AnimationController shakeController;
  late AnimationController scaleController;
  late Animation<Offset> _shakeAnimation;
  late Animation<double> scaleAnimation;
  final Random _random = Random();
  static const double baseMagnitude = 9.0;

  @override
  void initState() {
    super.initState();

    shakeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    // 1.0 ---> 1.1
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: scaleController,
        curve: Curves.easeInOut,
      ),
    );

    _shakeAnimation = createShakeAnimation().animate(shakeController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final global = Provider.of<GlobalState>(context, listen: false);
    global.refresh();
  }

  TweenSequence<Offset> createShakeAnimation() {
    final List<Offset> points = [];
    for (int i = 0; i < 5; i++) {
      final angle = _random.nextDouble() * 2 * pi;
      final magnitude = baseMagnitude * (1 - i * 0.15) + _random.nextDouble() * 4;
      points.add(Offset(cos(angle) * magnitude, sin(angle) * magnitude));
    }
    return TweenSequence<Offset>([
      for (int i = 0; i < points.length - 1; i++) TweenSequenceItem(tween: Tween<Offset>(begin: points[i], end: points[i + 1]), weight: 1),
      // ... //
      TweenSequenceItem(tween: Tween<Offset>(begin: points.last, end: Offset.zero), weight: 1),
    ]);
  }

  @override
  void dispose() {
    shakeController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalState>(context);

    return Scaffold(
      // backgroundColor: Colors.black,
      body: Column(
        children: [
          if (MediaQuery.of(context).size.width < 600) SizedBox(height: 20),
          genStatsPanel(global),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 40),
                  MouseRegion(
                    onEnter: (_) {
                      scaleController.forward();
                    },
                    onExit: (_) {
                      scaleController.reverse();
                    },
                    child: AnimatedBuilder(
                      animation: Listenable.merge([shakeController, scaleController]),
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..translate(
                              _shakeAnimation.value.dx,
                              _shakeAnimation.value.dy,
                            )
                            ..scale(scaleAnimation.value),
                          child: GestureDetector(
                            onTap: () {
                              if (global.vibrationSwitch) comboVibration();
                              if (global.animationsSwitch && !shakeController.isAnimating) {
                                _shakeAnimation = createShakeAnimation().animate(shakeController);
                                shakeController.forward(from: 0);
                              }
                              global.logs += global.axePower;
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(223, 77, 41, 0),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 83, 24, 0).withOpacity(0.5),
                                    blurRadius: 30,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                              child: Text(
                                global.Lang('Kliknij mnie!', 'Click me!'),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
