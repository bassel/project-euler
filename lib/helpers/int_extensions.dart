import 'dart:math';

extension IntExt on int {
  bool get isPrime {
    if (isEven && this != 2) return false;

    for (var i = 3; i <= sqrt(this); i += 2) {
      if (this % i == 0) return false;
    }

    return true;
  }
}
