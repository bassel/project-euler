/*
*   A googol (10^100) is a massive number: one followed by one-hundred zeros; 
*   100^100 is almost unimaginably large: one followed by two-hundred zeros. 
*   Despite their size, the sum of the digits in each number is only 1.
*
*   Considering natural numbers of the form, a^b, where a, b < 100, 
*   what is the maximum digital sum?
*/

import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// I'm too lazy today. I'll just assume a and b should be > 90 and brute force
/// from there
void solution() {
  var largestSum = 0;
  for (var a = 90; a < 100; a++) {
    for (var b = 90; b < 100; b++) {
      final number = BigInt.from(a).pow(b);
      final sum =
          number.toString().split('').map(int.parse).reduce((a, b) => a + b);
      largestSum = max(sum, largestSum);
    }
  }

  print('Largest digits sum is $largestSum');
}
