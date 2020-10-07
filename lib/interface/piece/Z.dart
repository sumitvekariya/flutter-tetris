import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';

class PieceZ extends Piece {
  List<List<List<int>>> _shapesZ = [];
  PieceZ(int x, int y) : super(x, y) {
    this.type = PieceTypes.Z;
    this.next = [
      [1, 1, 0, 0],
      [0, 1, 1, 0]
    ];

    _shapesZ.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 0, 0],
      [1, 0, 0, 0]
    ]);

    _shapesZ.insert(PieceRotation.Deg90.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 0, 0],
      [0, 1, 1, 0]
    ]);
    this.setShapes(_shapesZ);
  }
}
