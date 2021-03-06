/*
*   Surprisingly there are only three numbers that can be written as the sum 
*   of fourth powers of their digits:
*   
*          1634 = 1^4 + 6^4 + 3^4 + 4^4
*          8208 = 8^4 + 2^4 + 0^4 + 8^4
*          9474 = 9^4 + 4^4 + 7^4 + 4^4
*   As 1 = 1^4 is not a sum it is not included.
*   
*   The sum of these numbers is 1634 + 8208 + 9474 = 19316.
*   
*   Find the sum of all the numbers that can be written as the sum of fifth 
*   powers of their digits.
*/

import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Brute force seems reasonable.
void solution() {
  const power = 5;

  /// The limit can probably be reduced more than that, but I'm too lazy this
  /// morning to do the math
  final limit = pow(9, power) * power;
  var sum = 0;
  for (var i = 2; i < limit; i++) {
    final sumOfDigits = '$i'
        .split('')
        .map((e) => pow(int.parse(e), power))
        .reduce((a, b) => a + b);
    if (sumOfDigits == i) {
      sum += i;
    }
  }
  print('The sum is $sum');
}
