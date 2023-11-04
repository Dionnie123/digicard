extension SwappableList<E> on List<dynamic>? {
  void swap(int first, int second) {
    final temp = this?[first];
    this?[first] = this?[second];
    this?[second] = temp;
  }
}
