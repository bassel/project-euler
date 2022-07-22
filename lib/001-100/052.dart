/*
*   It can be seen that the number, 125874, and its double, 251748, contain 
*   exactly the same digits, but in a different order.
*
*   Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, 
*   contain the same digits.
*/

import 'package:collection/collection.dart';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Brute force
void solution() {
  const setEquality = SetEquality();
  var num = 1;
  while (true) {
    final x = '$num'.split('').toSet();
    final x2 = '${num * 2}'.split('').toSet();
    final x3 = '${num * 3}'.split('').toSet();
    final x4 = '${num * 4}'.split('').toSet();
    final x5 = '${num * 5}'.split('').toSet();
    final x6 = '${num * 6}'.split('').toSet();
    if (setEquality.equals(x, x2) &&
        setEquality.equals(x, x3) &&
        setEquality.equals(x, x4) &&
        setEquality.equals(x, x5) &&
        setEquality.equals(x, x6)) {
      break;
    }
    num++;
  }
  print('The number is $num');
}
