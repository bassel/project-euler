/*
*   If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
*   then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
*
*   If all the numbers from 1 to 1000 (one thousand) inclusive were written out 
*   in words, how many letters would be used?
*
*
*   NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
*   forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 
*   20 letters. The use of "and" when writing out numbers is in compliance with 
*   British usage.
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// This is a boring one and I hate it... But I'll solve it anyways
void solution() {
  /// We need to get these baselines first:
  /// 1-9
  const oneToNine = 3 + 3 + 5 + 4 + 4 + 3 + 5 + 5 + 4;

  /// 10-19
  const tenToNineteen = 3 + 6 + 6 + 8 + 8 + 7 + 7 + 9 + 8 + 8;

  /// The rest are patterns:
  /// twenty, twenty one, twenty two... = (twenty * 10) + (one to Nine)
  /// total = (twenty * 10) + (one to Nine) + (thirty * 10) + (1-9) ...
  const twentyTo99 = 60 + 60 + 50 + 50 + 50 + 70 + 60 + 60 + (oneToNine * 8);

  const allUntil99 = oneToNine + tenToNineteen + twentyTo99;

  /// one hundred + one hundred and (1->99)
  /// two hundred + two hundred and (1->99)
  const hundreds = 9 * allUntil99 +
      oneToNine * 100 +
      10 * 99 * 9 /* hundred and */ +
      7 * 9 /* 9 hundreds without and */;

  const oneThou = 3 + 8;
  const total = allUntil99 + hundreds + oneThou;

  print('Total: $total');
}
