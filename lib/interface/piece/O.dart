import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';

class PieceO extends Piece {
  List<List<List<int>>> _shapesO = [];
  PieceO(int x, int y) : super(x, y) {
    this.type = PieceTypes.O;
    this.next = [
      [0, 1, 1, 0],
      [0, 1, 1, 0]
    ];

    _shapesO.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 1, 0, 0]
    ]);
    this.setShapes(_shapesO);
  }
}
