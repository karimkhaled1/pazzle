import 'dart:math';
import 'data.dart';

List<Data> allData = List.filled(9, null);
Data clearSquare;

generateData() {
  for (int i = 0; i < 7; i++) {
    allData[i] = Data(((i + 1) / 3).ceil(), (i % 3) + 1, i + 1, i + 1,
        "assets/image_part_00" + (i + 1).toString() + ".jpg");
  }
  allData[7] = Data(3, 3, 9, 8, "assets/image_part_00" + 8.toString() + ".jpg");

  clearSquare = Data(3, 2, 8, 9, "");
  allData[8] = clearSquare;
}

suffle() {
  List<int> pickFrom = [1, 2, 3, 4, 5, 6, 7, 8];
  for (int i = 0; i < 8; i++) {
    int index = Random().nextInt(pickFrom.length) + 1;
    int removeAt=index;
    print(index);
    allData[i] = Data(
        ((i + 1) / 3).ceil(),
        (i % 3) + 1,
        i + 1,
        pickFrom[removeAt-1],
        "assets/image_part_00" +
            pickFrom.removeAt(index - 1).toString() +
            ".jpg");
  }

  clearSquare = Data(3, 3, 9, 9, "");
  allData[8] = clearSquare;
}

bool checkIfWon() {
  for (Data data in allData) {
    if (data.position != data.rightPosition) {
      for (Data data in allData) {
        print(data.toString());
      }
      return false;
    }
  }
  return true;
}

changePosition(Data data) {
  if ((data.x - clearSquare.x).abs() == 1 &&
      (data.y - clearSquare.y).abs() == 0) {
    Data temp =
        Data(data.x, data.y, data.position, clearSquare.rightPosition, "");
    allData[allData.indexOf(data)].x -= (data.x - clearSquare.x);
    allData[allData.indexOf(data)].position = clearSquare.position;
    clearSquare = temp;
    allData[8] = temp;
  } else if ((data.x - clearSquare.x).abs() == 0 &&
      (data.y - clearSquare.y).abs() == 1) {
    Data temp =
        Data(data.x, data.y, data.position, clearSquare.rightPosition, "");
    allData[allData.indexOf(data)].y -= (data.y - clearSquare.y);
    allData[allData.indexOf(data)].position = clearSquare.position;
    clearSquare = temp;

    allData[8] = temp;
  }
}
