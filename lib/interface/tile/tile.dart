import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double boxSize = 13.7;
const double smallBoxSize = 6.0;
final Color tileColor = Colors.black;
final Color paleTileColor = Colors.black12;

class Tile {
  int _value;
  bool isSolid;
  Widget tile;

  Tile(val, {isSmall}) {
    this._value = val;

    this.tile = Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          border:
              Border.all(color: this._value == 1 ? tileColor : paleTileColor)),
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: isSmall == true ? smallBoxSize : boxSize,
          minWidth: isSmall == true ? smallBoxSize : boxSize,
        ),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
              color: this._value == 1 ? tileColor : paleTileColor),
        ),
      ),
    );
  }
  bool get isFilled {
    return this._value == 1;
  }

  bool get isAnimated {
    return this._value == 2;
  }
}
