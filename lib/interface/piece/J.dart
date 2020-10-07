import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';
import 'dart:core';

class PieceJ extends Piece {
  List<List<List<int>>> _shapesJ = [];

  PieceJ(int x, int y) : super(x, y) {
    this.type = PieceTypes.J;
    this.next = [
      [1, 0, 0, 0],
      [1, 1, 1, 0]
    ];

    _shapesJ.insert(PieceRotation.Deg0.index, [
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 1, 0, 0],
      [1, 1, 0, 0]
    ]);

    _shapesJ.insert(PieceRotation.Deg90.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 1, 1, 0],
      [0, 0, 1, 0]
    ]);
    _shapesJ.insert(PieceRotation.Deg180.index, [
      [0, 0, 0, 0],
      [1, 1, 0, 0],
      [1, 0, 0, 0],
      [1, 0, 0, 0]
    ]);
    _shapesJ.insert(PieceRotation.Deg270.index, [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [1, 0, 0, 0],
      [1, 1, 1, 0]
    ]);

    this.setShapes(_shapesJ);
  }
}
