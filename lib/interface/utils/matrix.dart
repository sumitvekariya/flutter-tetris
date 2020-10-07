import 'package:tetris/interface/tile/empty-tile.dart';
import 'package:tetris/interface/tile/filled-tile.dart';
import 'package:tetris/interface/tile/tile.dart';
import 'dart:math';

class MatrixUtil {
  static final width = 10;
  static final height = 20;

  static List<Tile> getStartBoard({startLines = 0}) {
    if (startLines == 0) {
      final listTiles =
          List.generate(width * height, (index) => new EmptyTile());
      return listTiles;
    }
    List startMatrix = [];

    for (var i = 0; i < startLines; i++) {
      if (i <= 2) {
        // 0-3
        startMatrix.add([...getRandomFilledRow(5, 8)]);
      } else if (i <= 6) {
        // 4-6
        startMatrix.add([...getRandomFilledRow(4, 9)]);
      } else {
        // 7-9
        startMatrix.add([...getRandomFilledRow(3, 9)]);
      }
    }

    for (var i = 0, len = 20 - startLines; i < len; i++) {
      startMatrix.insert(0, [...emptyRow]);
    }
    return startMatrix;
  }

  static List<Tile> getRandomFilledRow(int min, int max) {
    final count = int.parse(
        '${(max - min + 1) * new Random().nextDouble() + min}',
        radix: 10);
    final line = List.generate(count, (i) => new FilledTile(isSolid: true))
        as List<Tile>;

    for (var i = 0, len = 10 - count; i < len; i++) {
      final index = int.parse(
          '${(line.length + 1) * new Random().nextDouble()}',
          radix: 10);
      line.insert(index, new EmptyTile());
    }

    return line;
  }

  static List<Tile> get emptyRow {
    final emptyRow = List.generate(width, (i) => new EmptyTile());
    return emptyRow;
  }

  static List<Tile> get fullRow {
    final filledRow = List.generate(width, (i) => new FilledTile());
    return filledRow;
  }

  static List<int> points = [100, 300, 700, 1500];
  static int maxPoint = 999999;
  static List<int> speedDelay = [700, 600, 450, 320, 240, 160];

  static getSpeedDelay(int speed) {
    return speedDelay[speed > 0 ? speed - 1 : 0];
  }
}
