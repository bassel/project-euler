/*
*   The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
*
*   Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

void solution() {
  var sum = BigInt.from(0);
  for (var i = 1; i <= 1000; i++) {
    sum += BigInt.from(i).pow(i);
  }
  final asString = sum.toString();
  print('The last 10 digits are: ${asString.substring(asString.length - 10)}');
}
