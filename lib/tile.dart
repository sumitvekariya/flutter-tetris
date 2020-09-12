import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double boxSize = 10.0;
final Color tileColor = Colors.black;
final Color paleTileColor = Colors.grey[400];

class Tile extends StatelessWidget {
  final bool isPale;
  final double size;
  Tile({Key key, this.isPale = false, this.size = boxSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: this.isPale ? paleTileColor : tileColor)),
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: this.size,
          minWidth: this.size,
        ),
        child: new DecoratedBox(
          decoration:
              new BoxDecoration(color: this.isPale ? paleTileColor : tileColor),
        ),
      ),
    );
  }
}
