/*
*   n! means n × (n − 1) × ... × 3 × 2 × 1
*
*   For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800, and the sum of the
*   digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
*
*   Find the sum of the digits in the number 100!
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Proposed solution idea
void solution() {
  var result = BigInt.one;
  for (var i = 2; i <= 100; i++) {
    result *= BigInt.from(i);
  }
  final digits = result.toString().split('').map((e) => int.parse(e));
  final digitsSum = digits.reduce((a, b) => a + b);
  print('The sum of digits is $digitsSum');
}
