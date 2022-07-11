/*
*   Let d(n) be defined as the sum of proper divisors of n 
*   (numbers less than n which divide evenly into n).
*   
*   If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair 
*   and each of a and b are called amicable numbers.
*   
*   For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 
*   55 and 110; therefore d(220) = 284. The proper divisors of 284 are 
*   1, 2, 4, 71 and 142; so d(284) = 220.
*   
*   Evaluate the sum of all the amicable numbers under 10000.
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Brute force is enough
void solution() {
  /// Step 1. Compute the sum of proper divisors for each number under 10000
  final list = List.generate(10000, (n) => d(n)).toList();

  /// Step 2. Find the numbers that have the needed conditions
  var sum = 0;
  for (var a = 1; a < list.length; a++) {
    final dA = list[a];
    final b = dA;
    if (b < list.length) {
      final dB = list[b];
      if (dA == b && dB == a && a != b) {
        sum += a;
      }
    }
  }
  print('Sum is $sum');
}

int d(int n) {
  var sum = 0;
  for (var i = 1; i <= n / 2; i++) {
    if (n % i == 0) sum += i;
  }
  return sum;
}

/*
*   Overview: https://projecteuler.net/overview=021
*
*   They have some extra optimizations, but the above runs fine
*/
