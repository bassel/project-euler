/*
*   The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
*
*   Find the sum of all numbers, less than one million, which are palindromic 
*   in base 10 and base 2.
*
*   (Please note that the palindromic number, in either base, may not 
*   include leading zeros.)
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Brute force should be fine
void solution() {
  var sum = 0;
  for (var i = 1; i < 1000000; i++) {
    final number = i;
    final reversed = int.parse('$i'.split('').reversed.join(''));
    if ('$number' == '$reversed') {
      final numBase2 = number.toRadixString(2);
      if (numBase2.startsWith('0')) {
        continue;
      }
      final reversedBase2 = numBase2.split('').reversed.join('');
      if (numBase2 == reversedBase2) {
        sum += number;
      }
    }
  }
  print('The sum is $sum');
}

/*
*   Overview: https://projecteuler.net/overview=036
*
*   Generates palindroms instead of checking for them. Definitely better for 
*   higher limits
*/
