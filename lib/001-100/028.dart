/*
*   Starting with the number 1 and moving to the right in a clockwise 
*   direction a 5 by 5 spiral is formed as follows:
*   
*                     21 22 23 24 25
*                     20  7  8  9 10
*                     19  6  1  2 11
*                     18  5  4  3 12
*                     17 16 15 14 13
*   
*   It can be verified that the sum of the numbers on the diagonals is 101.
*   
*   What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral 
*   formed in the same way?
*/

import '../helpers/measure_runtime.dart';

void main() {
  executeAndMeasure(solution);
}

/// Just start from the center and follow the pattern emerging:
/// we don't need to generate the entire spiral since we can easily know the
/// numbers on the diagonals
void solution() {
  const size = 1001;
  final layersToTraverse = size ~/ 2;

  const spacerIncrement = 2;
  var spacer = 2;
  var currentNumber = 1;
  var sum = 1;

  for (var i = 1; i <= layersToTraverse; i++) {
    for (var j = 0; j < 4; j++) {
      currentNumber += spacer;
      sum += currentNumber;
    }
    spacer += spacerIncrement;
  }

  print('The sum is: $sum');
}
