class BinaryNode<T> {
  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  BinaryNode(
    this.value, {
    this.leftChild,
    this.rightChild,
  });

  @override
  String toString() {
    return '''
   $value
  /  \\
${leftChild?.value}    ${rightChild?.value}
''';
  }
}
