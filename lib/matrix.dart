import 'package:flutter/material.dart';
import 'package:tetris/store/store.dart';

class MatrixView extends StatelessWidget {
  final TetrisStore tetrisState;

  MatrixView(this.tetrisState);

  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        children: tetrisState.matrix.length > 0
            ? tetrisState.matrixWidget
            : [
                Container(
                  width: 0.0,
                  height: 0.0,
                )
              ]);
  }
}
