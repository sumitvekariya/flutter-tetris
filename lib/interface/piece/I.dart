import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';

class PieceI extends Piece {
  List<List<List<int>>> _shapesI = [];
  PieceI(int x, int y) : super(x, y) {
    this.type = PieceTypes.I;
    this.next = [
      [0, 0, 0, 0],
      [1, 1, 1, 1]
    ];

    _shapesI.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 1, 1]
    ]);

    _shapesI.insert(PieceRotation.Deg90.index, [
      [1, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 0, 0, 0]
    ]);
    this.setShapes(_shapesI);
  }
}
