import 'package:tetris/interface/piece/piece-enum.dart';
import 'package:tetris/interface/utils/matrix.dart';
import 'package:tetris/tile.dart';

class Piece {
  int x;
  int y;
  int rotation = PieceRotation.Deg0.index;
  PieceTypes type;
  List<List<int>> shape;
  List<List<int>> next;

  List<List<List<int>>> _shapes;
  Map _lastConfig;

  List<Tile> nextWidget = [];

  Piece(int x, int y) {
    this.x = x;
    this.y = y;
  }

  setShapes(List<List<List<int>>> shapes) {
    this._shapes = shapes;
    this.shape = shapes[this.rotation];
  }

  Piece store() {
    // this._lastConfig = {
    //   x: this.x,
    //   y: this.y,
    //   rotation: this.rotation,
    //   shape: this.shape
    // };
    this._lastConfig = new Map();
    this._lastConfig['x'] = this.x;
    this._lastConfig['y'] = this.y;
    this._lastConfig['rotation'] = this.rotation;
    this._lastConfig['shape'] = this.shape;

    return this._newPiece();
  }

  Piece clearStore() {
    this._lastConfig = null;
    return this._newPiece();
  }

  Piece revert() {
    if (this._lastConfig != null) {
      this.x = this._lastConfig['x'];
      this.y = this._lastConfig['y'];
      this.rotation = this._lastConfig['rotation'];
      this.shape = this._lastConfig['shape'];

      this._lastConfig = null;
    }
    return this._newPiece();
  }

  Piece rotate() {
    var isTurnOver = this.rotation >= this._shapes.length - 1;
    this.rotation = isTurnOver ? 0 : this.rotation + 1;
    this.shape = this._shapes[this.rotation];
    return this._newPiece();
  }

  Piece moveDown({int step = 1}) {
    this.y = this.y + step;
    return this._newPiece();
  }

  Piece moveRight() {
    this.x++;
    return this._newPiece();
  }

  Piece moveLeft() {
    this.x--;
    return this._newPiece();
  }

  List get positionOnGrid {
    var positions = [];
    for (var row = 0; row < 4; row++) {
      for (var col = 0; col < 4; col++) {
        if (this.shape[row][col] == 1) {
          var position = (this.y + row) * MatrixUtil.width + this.x + col;
          if (position >= 0) {
            positions.add(position);
          }
        }
      }
    }
    return positions;
  }

  get bottomRow {
    return this.y + 3;
  }

  get rightCol {
    var col = 3;
    while (col >= 0) {
      for (var row = 0; row <= 3; row++) {
        if (this.shape[row][col] != null && this.shape[row][col] != 0) {
          return this.x + col;
        }
      }
      col--;
    }
  }

  get leftCol {
    return this.x;
  }

  Piece _newPiece() {
    var piece = new Piece(this.x, this.y);
    piece.rotation = this.rotation;
    piece.type = this.type;
    piece.next = this.next;
    piece.setShapes(this._shapes);
    piece._lastConfig = this._lastConfig;
    return piece;
  }
}
