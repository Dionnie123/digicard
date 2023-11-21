extension SwappableList<E> on List<dynamic>? {
  void swap(int first, int second) {
    final temp = this?[first];
    this?[first] = this?[second];
    this?[second] = temp;
  }
}

List<T> swapElements<T>(List<T> list, int index1, int index2) {
  if (index1 < 0 ||
      index1 >= list.length ||
      index2 < 0 ||
      index2 >= list.length) {
    // Check if indices are within the valid range of the list
    print("Invalid indices");
    return list;
  }

  if (index1 == index2) {
    // No need to swap if the indices are the same
    return list;
  }

  // Swap the elements using a temporary variable
  T temp = list[index1];
  list[index1] = list[index2];
  list[index2] = temp;
  return list;
}
