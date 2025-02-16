import 'dart:math';

int randInt(int x, int y) {
  if (x > y) {
    int tmp = x;
    x = y;
    y = tmp;
  }
  final random = Random();
  return random.nextInt(y - x + 1) + x;
}

double randDouble(double x, double y) {
  if (x > y) {
    double tmp = x;
    x = y;
    y = tmp;
  }
  final random = Random();
  return random.nextDouble() * (y - x) + x;
}
