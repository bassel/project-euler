/*
*   There are exactly ten ways of selecting three from five, 12345:
*   
*   123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
*   
*   How many, not necessarily distinct, values of (n r) for 1 <= n <= 100
*   are greater than one-million?
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// First we compute all factorials to avoid computing them on every single
/// iteration. We need BigInt since the numbers will get huge.
/// After that brute force is enough, even though improvements can definitely
/// still be made.
void solution() {
  final factorials = <int, BigInt>{0: BigInt.one};
  for (var i = 1; i <= 100; i++) {
    factorials[i] = BigInt.from(i) * factorials[i - 1]!;
  }

  var count = 0;
  for (var n = 1; n <= 100; n++) {
    for (var r = 1; r <= n; r++) {
      final result = factorials[n]! / (factorials[r]! * factorials[n - r]!);
      if (result > 1000000) count++;
    }
  }
  print('There are $count values');
}

/*
*   Overview: https://projecteuler.net/overview=053
*
*   As expected, optimizations using maths were possible
*/
