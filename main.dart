// [3] => "3"
// [3, 1, 4, 2] => "1-4"
// [10, 20, 30, 40] => "10, 20, 30, 40"
// [1, 4, 5, 2, 3, 9, 8, 11, 0] => "0-5,8-9,11"
// [10, 20, 30, 40, 90, 100, 101, 102, 103, 42, 41] => "10,20,30,40-42,90,100-103"

void main() {
  print(getString([3]));
  print(getString([3, 1, 4, 2]));
  print(getString([10, 20, 30, 40]));
  print(getString([1, 4, 5, 2, 3, 9, 8, 11, 0]));
  print(getString([10, 20, 30, 40, 90, 100, 101, 102, 103, 42, 41]));
}

String getString(List<int> listToString) {
  listToString.sort();
  return listToString
      .fold(<List<int>>[], (List<List<int>> list, i) {
        if (list.isEmpty) {
          list.add([i]);
          return list;
        }
        if ((list.last.last + 1) == i) {
          list.last.add(i);
        } else {
          list.add([i]);
        }
        return list;
      })
      .map((l) => l.length == 1 ? '${l.first}' : '${l.first}-${l.last}')
      .join(',');
}
