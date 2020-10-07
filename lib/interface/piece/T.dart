import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';

class PieceT extends Piece {
  List<List<List<int>>> _shapesT = [];

  PieceT(int x, int y) : super(x, y) {
    this.type = PieceTypes.T;
    this.next = [
      [0, 1, 0, 0],
      [1, 1, 1, 0]
    ];

    _shapesT.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 1, 0]
    ]);

    _shapesT.insert(PieceRotation.Deg90.index, [
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 0, 0, 0]
    ]);
    _shapesT.insert(PieceRotation.Deg180.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0]
    ]);
    _shapesT.insert(PieceRotation.Deg270.index, [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 0, 0],
      [0, 1, 0, 0]
    ]);

    this.setShapes(_shapesT);
  }
}
