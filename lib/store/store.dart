import 'dart:async';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:tetris/factory/piece-factory.dart';
import 'package:tetris/interface/game-store.dart';
import 'package:tetris/interface/tetris-state.dart';
import 'package:tetris/interface/tile/empty-tile.dart';
import 'package:tetris/interface/tile/filled-tile.dart';
import 'package:tetris/interface/tile/tile.dart';
import 'package:tetris/interface/piece/piece.dart';
import 'package:tetris/interface/utils/matrix.dart';
import 'package:tetris/sound/sound-manager.dart';

part 'store.g.dart';

class TetrisStore = _TetrisStore with _$TetrisStore;

abstract class _TetrisStore with Store {
  @observable
  List<Tile> matrix = MatrixUtil.getStartBoard();

  @observable
  Piece current;

  @observable
  Piece next = PieceFactory.getRandomPiece();

  @observable
  int points = 0;

  @observable
  bool locked = true;

  @observable
  bool sound = true;

  int initSpeed = 1;

  int speed = 1;

  int initLine = 0;

  int clearedLines = 0;

  @observable
  GameState gameState = GameState.Loading;

  @observable
  TetrisState saved;

  int max = 0;

  Timer _gameInterval;

  @computed
  List<Widget> get matrixWidget {
    return matrix.map((e) => e.tile).toList();
  }

  @computed
  List<Widget> get nextWidget {
    return current != null &&
            next != null &&
            next.next != null &&
            next.next.length > 0
        ? next.next
            .expand((element) => element)
            .map((e) => e > 0
                ? new FilledTile(isSmall: true).tile
                : new EmptyTile(isSmall: true).tile)
            .toList()
        : List.generate(8, (index) => new EmptyTile(isSmall: true).tile);
  }

  @computed
  int get startLine {
    if (this.current != null) {
      return this.clearedLines;
    } else {
      return this.clearedLines;
    }
  }

  @action
  void start() {
    SoundManager.start(sound);
    if (this.current == null) {
      this._setCurrentPiece(this.next);
      this._setNext();
    }
    final initLine = this.initLine;
    final initSpeed = this.initSpeed;

    this.points = 0;
    this.gameState = GameState.Started;
    this.matrix = MatrixUtil.getStartBoard(startLines: initLine);
    this.speed = initSpeed;

    this._unsubscribe();

    this.auto(MatrixUtil.getSpeedDelay(initSpeed));
    this._setLocked(false);
  }

  @action
  void muteUnmute() {
    sound = !sound;
    SoundManager.muteUnmute(sound);
  }

  bool get _isGameOver {
    this._setCurrentPiece(this.current.store());
    this._setCurrentPiece(this.current.moveDown());
    if (this._isCollidesBottom) {
      return true;
    }
    this._setCurrentPiece(this.current.revert());
    return false;
  }

  bool get _isCollidesBottom {
    if (this.current.bottomRow >= MatrixUtil.height) {
      return true;
    }
    return this.collides;
  }

  bool get collides {
    return this
        .current
        .positionOnGrid
        .any((pos) => this.matrix[pos].isSolid == true);
  }

  bool get _isCollidesLeft {
    if (this.current.leftCol < 0) {
      return true;
    }
    return collides;
  }

  bool get _isCollidesRight {
    if (this.current.rightCol >= MatrixUtil.width) {
      return true;
    }
    return collides;
  }

  auto(int delay) {
    this._gameInterval =
        Timer.periodic(new Duration(milliseconds: delay), (Timer t) {
      this._update();
    });
  }

  _unsubscribe() {
    if (this._gameInterval != null) {
      this._gameInterval.cancel();
    }
  }

  rotate() {
    if (this.locked == true) {
      return;
    }

    SoundManager.move(sound);
    this._clearPiece();
    this._setCurrentPiece(this.current.store());
    this._setCurrentPiece(this.current.rotate());
    while (_isCollidesRight) {
      this._setCurrentPiece(this.current.moveLeft());
      if (this._isCollidesLeft) {
        this._setCurrentPiece(this.current.revert());
        break;
      }
    }
    this._drawPiece();
  }

  moveDown() {
    SoundManager.move(sound);
    this._update();
  }

  moveLeft() {
    if (this.locked == true) {
      return;
    }
    SoundManager.move(sound);
    this._clearPiece();
    this._setCurrentPiece(this.current.store());
    this._setCurrentPiece(this.current.moveLeft());
    if (this._isCollidesLeft) {
      this._setCurrentPiece(this.current.revert());
    }
    this._drawPiece();
  }

  moveRight() {
    if (this.locked == true) {
      return;
    }
    SoundManager.move(sound);
    this._clearPiece();
    this._setCurrentPiece(this.current.store());
    this._setCurrentPiece(this.current.moveRight());
    if (this._isCollidesRight) {
      this._setCurrentPiece(this.current.revert());
    }
    this._drawPiece();
  }

  drop() {
    if (this.locked != false) {
      return;
    }
    SoundManager.fall(sound);
    while (!this._isCollidesBottom) {
      this._clearPiece();
      this._setCurrentPiece(this.current.store());
      this._setCurrentPiece(this.current.moveDown());
    }
    this._setCurrentPiece(this.current.revert());
    this._drawPiece();
  }

  _update() {
    if (this.locked == true) {
      return;
    }
    this._setLocked(true);
    this._setCurrentPiece(this.current.revert());
    this._clearPiece();
    this._setCurrentPiece(this.current.store());

    this._setCurrentPiece(this.current.moveDown());

    if (this._isCollidesBottom) {
      this._setCurrentPiece(this.current.revert());
      this._markAsSolid();
      this._drawPiece();
      this._clearFullLines();
      this._setCurrentPiece(this.next);
      this._setNext();
      if (_isGameOver == true) {
        this._onGameOver();
        return;
      }
    } else {}
    this._drawPiece();
    this._setLocked(false);
  }

  createInitialState() {
    matrix = MatrixUtil.getStartBoard();
    current = null;
    next = PieceFactory.getRandomPiece();
    points = 0;
    locked = true;
    sound = true;
    initLine = 0;
    clearedLines = 0;
    initSpeed = 1;
    speed = 1;
    gameState = GameState.Loading;
    saved = null;
    // max = LocalStorageService.maxPoint
  }

  _onGameOver() {
    this.pause();
    SoundManager.gameOver(sound);
    var maxPoint = points > max ? points : max;
    // LocalStorageService.setMaxPoint(maxPoint);

    this.max = maxPoint;
    this.gameState = GameState.Over;
    // this.createInitialState();
  }

  pause() {
    this.locked = true;
    this.gameState = GameState.Paused;
    SoundManager.move(sound);
    this._unsubscribe();
  }

  resume() {
    var speed = this.speed;
    SoundManager.move(sound);
    this.locked = false;
    this.gameState = GameState.Started;
    this.auto(MatrixUtil.getSpeedDelay(speed));
  }

  _clearFullLines() {
    var numberOfClearedLines = 0;
    var newMatrix = [...this.matrix];
    for (var row = MatrixUtil.height - 1; row >= 0; row--) {
      var pos = row * MatrixUtil.width;
      var fullRowTiles = newMatrix.sublist(pos, pos + MatrixUtil.width);
      var isFullRow = fullRowTiles.every((x) => x.isSolid == true);
      if (isFullRow) {
        numberOfClearedLines++;
        var topPortion = this.matrix.sublist(0, row * MatrixUtil.width);
        newMatrix.removeRange(0, ++row * MatrixUtil.width);
        newMatrix.insertAll(0, [...MatrixUtil.emptyRow, ...topPortion]);
        this._setMatrix(newMatrix);
      }
    }
    this._setPointsAndSpeed(numberOfClearedLines);
  }

  _setPointsAndSpeed(int numberOfClearedLines) {
    if (numberOfClearedLines < 1) {
      return;
    }
    SoundManager.clear(sound);

    var newLines = this.clearedLines + numberOfClearedLines;
    var newPoints = this._getPoints(numberOfClearedLines, points);
    var newSpeed = this._getSpeed(newLines, initSpeed);

    this.points = newPoints;
    this.clearedLines = newLines;
    this.speed = newSpeed;

    if (newSpeed != speed) {
      this._unsubscribe();
      this.auto(MatrixUtil.getSpeedDelay(newSpeed));
    }
  }

  int _getSpeed(int totalLines, int initSpeed) {
    var addedSpeed = (totalLines / MatrixUtil.height).floor();
    var newSpeed = initSpeed + addedSpeed;
    newSpeed = newSpeed > 6 ? 6 : newSpeed;
    return newSpeed;
  }

  int _getPoints(int numberOfClearedLines, int points) {
    var addedPoints = MatrixUtil.points[numberOfClearedLines - 1];
    var newPoints = points + addedPoints;
    return newPoints > MatrixUtil.maxPoint ? MatrixUtil.maxPoint : newPoints;
  }

  _drawPiece() {
    this._setCurrentPiece(this.current.clearStore());
    this._loopThroughPiecePosition((position) {
      // if (position <= 200) {
      bool isSolid = this.matrix[position].isSolid;
      this._updateMatrix(position, new FilledTile(isSolid: isSolid));
      // }
    });
  }

  _markAsSolid() {
    this._loopThroughPiecePosition((position) {
      print(position);
      this._updateMatrix(position, new FilledTile(isSolid: true));
    });
  }

  _updateMatrix(int pos, Tile tile) {
    // if (pos <= 200) {
    var newMatrix = [...this.matrix];
    newMatrix[pos] = tile;
    this._setMatrix(newMatrix);
    // }
  }

  _setMatrix(List<Tile> matrix) {
    this.matrix = matrix;
  }

  _clearPiece() {
    this._loopThroughPiecePosition((position) {
      this._updateMatrix(position, new EmptyTile());
    });
  }

  _loopThroughPiecePosition(Function callBack) {
    this.current.positionOnGrid.forEach((position) => callBack(position));
  }

  _setLocked(bool locked) {
    this.locked = locked;
  }

  _setNext() {
    this.next = PieceFactory.getRandomPiece();
  }

  _setCurrentPiece(Piece piece) {
    this.current = piece;
  }

  reset() {
    createInitialState();
  }

  // ignore: avoid_void_async
  void dispose() async {}
}
