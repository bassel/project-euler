/*
*   The number, 1406357289, is a 0 to 9 pandigital number because it is made up 
*   of each of the digits 0 to 9 in some order, but it also has a rather 
*   interesting sub-string divisibility property.
*   
*   Let d1 be the 1st digit, d2 be the 2nd digit, and so on. 
*   In this way, we note the following:
*   
*   d2d3d4=406 is divisible by 2
*   d3d4d5=063 is divisible by 3
*   d4d5d6=635 is divisible by 5
*   d5d6d7=357 is divisible by 7
*   d6d7d8=572 is divisible by 11
*   d7d8d9=728 is divisible by 13
*   d8d9d10=289 is divisible by 17
*
*   Find the sum of all 0 to 9 pandigital numbers with this property.
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

final pandigitals = <String>[];

void solution() {
  permutation('', '0123456789');
  print('The sum is: ${pandigitals.map(int.parse).reduce((a, b) => a + b)}');
}

/// Generating all permutations takes too long (3780 milliseconds),
/// but we can optimize this easily.
/// If the property d2d3d4 doesn't hold, we don't need to generate the rest of
/// the permutations starting with these 4 digits. That saves us a lot of
/// computation.
/// Same goes for the rest of properties.
/// We can do the checks as we go
///
/// Result: runtime reduced to 44 milliseconds
void permutation(String prefix, String str) {
  int n = str.length;
  if (!propertiesHold(prefix)) {
    return;
  } else if (n == 0) {
    pandigitals.add(prefix);
  } else {
    for (int i = 0; i < n; i++) {
      permutation(
        prefix + str[i],
        str.substring(0, i) + str.substring(i + 1, n),
      );
    }
  }
}

bool propertiesHold(String s) {
  switch (s.length) {
    case 4:
      final n = int.parse(s.substring(1));
      return n % 2 == 0;
    case 5:
      final n = int.parse(s.substring(2));
      return n % 3 == 0;
    case 6:
      final n = int.parse(s.substring(3));
      return n % 5 == 0;
    case 7:
      final n = int.parse(s.substring(4));
      return n % 7 == 0;
    case 8:
      final n = int.parse(s.substring(5));
      return n % 11 == 0;
    case 9:
      final n = int.parse(s.substring(6));
      return n % 13 == 0;
    case 10:
      final n = int.parse(s.substring(7));
      return n % 17 == 0;
    default:
      return true;
  }
}
