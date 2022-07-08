/*
*   A Pythagorean triplet is a set of three natural numbers, a < b < c, 
*   for which `a^2 + b^2 = c^2`
*   
*   For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
*
*   There exists exactly one Pythagorean triplet for which a + b + c = 1000.
*   Find the product abc.
*/

import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(bruteForceSolution);
}

/// 1000 iterations isn't much, even with a O(n^2) input we can handle it
///
/// I feel like an optmized approach would need more math tricks, so I'll stop here
void bruteForceSolution() {
  for (var a = 1; a < 999; a++) {
    for (var b = a + 1; b < 1000; b++) {
      final c = 1000 - a - b;
      if (pow(c, 2) == pow(a, 2) + pow(b, 2)) {
        print('Brute force solution -- a: $a / b: $b / c: $c');
        print('Product is: ${a * b * c}');
        return;
      }
    }
  }
}

/*
*   Overview: https://projecteuler.net/overview=009
*
*   Even the brute force had room for optimizations with some math to figure
*   out the upper limits.
*
*   The alternatives, as expected, need a lot more math... 
*/
