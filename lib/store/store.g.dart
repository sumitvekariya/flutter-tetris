// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TetrisStore on _TetrisStore, Store {
  Computed<List<Widget>> _$matrixWidgetComputed;

  @override
  List<Widget> get matrixWidget => (_$matrixWidgetComputed ??=
          Computed<List<Widget>>(() => super.matrixWidget,
              name: '_TetrisStore.matrixWidget'))
      .value;
  Computed<List<Widget>> _$nextWidgetComputed;

  @override
  List<Widget> get nextWidget =>
      (_$nextWidgetComputed ??= Computed<List<Widget>>(() => super.nextWidget,
              name: '_TetrisStore.nextWidget'))
          .value;
  Computed<int> _$startLineComputed;

  @override
  int get startLine => (_$startLineComputed ??=
          Computed<int>(() => super.startLine, name: '_TetrisStore.startLine'))
      .value;

  final _$matrixAtom = Atom(name: '_TetrisStore.matrix');

  @override
  List<Tile> get matrix {
    _$matrixAtom.reportRead();
    return super.matrix;
  }

  @override
  set matrix(List<Tile> value) {
    _$matrixAtom.reportWrite(value, super.matrix, () {
      super.matrix = value;
    });
  }

  final _$currentAtom = Atom(name: '_TetrisStore.current');

  @override
  Piece get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(Piece value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$nextAtom = Atom(name: '_TetrisStore.next');

  @override
  Piece get next {
    _$nextAtom.reportRead();
    return super.next;
  }

  @override
  set next(Piece value) {
    _$nextAtom.reportWrite(value, super.next, () {
      super.next = value;
    });
  }

  final _$pointsAtom = Atom(name: '_TetrisStore.points');

  @override
  int get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(int value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  final _$lockedAtom = Atom(name: '_TetrisStore.locked');

  @override
  bool get locked {
    _$lockedAtom.reportRead();
    return super.locked;
  }

  @override
  set locked(bool value) {
    _$lockedAtom.reportWrite(value, super.locked, () {
      super.locked = value;
    });
  }

  final _$soundAtom = Atom(name: '_TetrisStore.sound');

  @override
  bool get sound {
    _$soundAtom.reportRead();
    return super.sound;
  }

  @override
  set sound(bool value) {
    _$soundAtom.reportWrite(value, super.sound, () {
      super.sound = value;
    });
  }

  final _$gameStateAtom = Atom(name: '_TetrisStore.gameState');

  @override
  GameState get gameState {
    _$gameStateAtom.reportRead();
    return super.gameState;
  }

  @override
  set gameState(GameState value) {
    _$gameStateAtom.reportWrite(value, super.gameState, () {
      super.gameState = value;
    });
  }

  final _$savedAtom = Atom(name: '_TetrisStore.saved');

  @override
  TetrisState get saved {
    _$savedAtom.reportRead();
    return super.saved;
  }

  @override
  set saved(TetrisState value) {
    _$savedAtom.reportWrite(value, super.saved, () {
      super.saved = value;
    });
  }

  final _$_TetrisStoreActionController = ActionController(name: '_TetrisStore');

  @override
  void start() {
    final _$actionInfo =
        _$_TetrisStoreActionController.startAction(name: '_TetrisStore.start');
    try {
      return super.start();
    } finally {
      _$_TetrisStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void muteUnmute() {
    final _$actionInfo = _$_TetrisStoreActionController.startAction(
        name: '_TetrisStore.muteUnmute');
    try {
      return super.muteUnmute();
    } finally {
      _$_TetrisStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
matrix: ${matrix},
current: ${current},
next: ${next},
points: ${points},
locked: ${locked},
sound: ${sound},
gameState: ${gameState},
saved: ${saved},
matrixWidget: ${matrixWidget},
nextWidget: ${nextWidget},
startLine: ${startLine}
    ''';
  }
}
