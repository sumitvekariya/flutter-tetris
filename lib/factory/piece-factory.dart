import 'package:tetris/interface/piece/I.dart';
import 'package:tetris/interface/piece/J.dart';
import 'package:tetris/interface/piece/L.dart';
import 'package:tetris/interface/piece/O.dart';
import 'package:tetris/interface/piece/S.dart';
import 'package:tetris/interface/piece/T.dart';
import 'package:tetris/interface/piece/Z.dart';
import 'package:tetris/interface/piece/dot.dart';
import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/piece/piece.dart';
import 'dart:math';

const SPAWN_POSITION_X = 4;
const SPAWN_POSITION_Y = -4;

class PieceFactory {
  static Piece getRandomPiece({x = SPAWN_POSITION_X, y = SPAWN_POSITION_Y}) {
    int idx = new Random().nextInt(8);
    // int idx = 1;

    if (idx == PieceTypes.I.index || idx == 0) {
      return new PieceI(x, y);
    } else if (idx == PieceTypes.J.index) {
      return new PieceJ(x, y);
    } else if (idx == PieceTypes.L.index) {
      return new PieceL(x, y);
    } else if (idx == PieceTypes.O.index) {
      return new PieceO(x, y);
    } else if (idx == PieceTypes.S.index) {
      return new PieceS(x, y);
    } else if (idx == PieceTypes.T.index) {
      return new PieceT(x, y);
    } else if (idx == PieceTypes.Z.index) {
      return new PieceZ(x, y);
    }
    return new PieceDot(x, y);
  }
}
