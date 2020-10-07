import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';

class PieceL extends Piece {
  List<List<List<int>>> _shapesL = [];

  PieceL(int x, int y) : super(x, y) {
    this.type = PieceTypes.L;
    this.next = [
      [0, 0, 1, 0],
      [1, 1, 1, 0]
    ];

    _shapesL.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 0, 0]
    ]);

    _shapesL.insert(PieceRotation.Deg90.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 1, 0],
      [1, 0, 0, 0]
    ]);
    _shapesL.insert(PieceRotation.Deg180.index, [
      [0, 0, 0, 0],
      [1, 1, 0, 0],
      [0, 1, 0, 0],
      [0, 1, 0, 0]
    ]);
    _shapesL.insert(PieceRotation.Deg270.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 1, 0],
      [1, 1, 1, 0]
    ]);

    this.setShapes(_shapesL);
  }
}
