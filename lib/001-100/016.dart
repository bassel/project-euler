/*
*   2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
*
*   What is the sum of the digits of the number 2^1000?
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

void solution() {
  final res = BigInt.from(2)
      .pow(1000)
      .toString()
      .split('')
      .map((e) => int.parse(e))
      .reduce((a, b) => a + b);
  print('Sum of digits is: $res');
}
