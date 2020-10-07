import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';

class PieceS extends Piece {
  List<List<List<int>>> _shapesS = [];
  PieceS(int x, int y) : super(x, y) {
    this.type = PieceTypes.S;
    this.next = [
      [0, 1, 1, 0],
      [1, 1, 0, 0]
    ];

    _shapesS.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 0, 0],
      [0, 1, 0, 0]
    ]);

    _shapesS.insert(PieceRotation.Deg90.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [1, 1, 0, 0]
    ]);
    this.setShapes(_shapesS);
  }
}
