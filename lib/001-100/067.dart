/*
*   By starting at the top of the triangle below and moving to adjacent numbers 
*   on the row below, the maximum total from top to bottom is 23.
*   
*              3
*             7 4
*            2 4 6
*           8 5 9 3
*   
*   That is, 3 + 7 + 4 + 9 = 23.
*   
*   Find the maximum total from top to bottom in 067.txt, 
*   a 15K text file containing a triangle with one-hundred rows.
*   
*   NOTE: This is a much more difficult version of Problem 18. It is not 
*   possible to try every route to solve this problem, as there are 299 
*   altogether! If you could check one trillion (1012) routes every second it 
*   would take over twenty billion years to check them all. There is an 
*   efficient algorithm to solve it. ;o)
*/

import 'dart:io';
import 'dart:math';

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Tried the solution I made for problem 18, but as expected it took ages and
/// didn't even finish. What I'll do here is to only iterate through the
/// triangle and replace each node with the max sum we can get for it
void solution() {
  final file = File('./assets/001-100/067.txt');
  final content = file.readAsLinesSync();
  final triangle = [
    for (final line in content)
      line.split(' ').map((e) => int.parse(e)).toList()
  ];

  for (var i = triangle.length - 2; i >= 0; i--) {
    for (var j = 0; j < triangle[i].length; j++) {
      triangle[i][j] =
          triangle[i][j] + max(triangle[i + 1][j], triangle[i + 1][j + 1]);
    }
  }

  print('Max total is ${triangle.first.first}');
}
