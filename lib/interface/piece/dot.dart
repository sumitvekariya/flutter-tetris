import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';

class PieceDot extends Piece {
  List<List<List<int>>> _shapesDot = [];

  PieceDot(int x, int y) : super(x, y) {
    this.type = PieceTypes.Dot;
    this.next = [
      [0, 0, 0, 0],
      [1, 0, 0, 0]
    ];

    _shapesDot.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0]
    ]);

    this.setShapes(_shapesDot);
  }
}
