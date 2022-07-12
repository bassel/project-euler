/*
*   The Fibonacci sequence is defined by the recurrence relation:
*
*           Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
*   
*   Hence the first 12 terms will be:
*   
*                     F1 = 1
*                     F2 = 1
*                     F3 = 2
*                     F4 = 3
*                     F5 = 5
*                     F6 = 8
*                     F7 = 13
*                     F8 = 21
*                     F9 = 34
*                     F10 = 55
*                     F11 = 89
*                     F12 = 144
*   The 12th term, F12, is the first term to contain three digits.
*   
*   What is the index of the first term in the Fibonacci sequence to contain 
*   1000 digits?
*/

import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// We will reach a fibb number with 1000 digits, so we'll need to use the
/// custom summation method to succeed
void solution() {
  var prevprev = '1';
  var prev = '1';
  var next = '2';
  var index = 3;
  while (next.length < 1000) {
    prevprev = prev;
    prev = next;
    next = sum(prevprev, prev);
    index++;
  }

  print('The target fib number is F($index)=$next');
}

String sum(String a, String b) {
  final padding = max(a.length, b.length);
  final paddedA = a.padLeft(padding, '0');
  final paddedB = b.padLeft(padding, '0');

  var result = '';
  var carry = 0;
  for (var i = paddedA.length - 1; i >= 0; i--) {
    var sum = int.parse(paddedA[i]) + int.parse(paddedB[i]) + carry % 10;
    result = '${sum % 10}$result';
    carry = carry ~/ 10 + sum ~/ 10;
  }
  if (carry > 0) {
    result = '$carry$result';
  }
  return result;
}
