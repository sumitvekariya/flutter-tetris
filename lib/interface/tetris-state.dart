import 'package:tetris/interface/game-store.dart';
import 'package:tetris/interface/piece/piece.dart';
import 'package:tetris/interface/tile/tile.dart';

class TetrisState {
  List<Tile> matrix;
  Piece current;
  Piece next;
  int points;
  bool locked;
  bool sound;
  int initSpeed;
  int speed;
  int initLine;
  int clearedLines;
  GameState gameState;
  TetrisState saved;
  int max;
}
