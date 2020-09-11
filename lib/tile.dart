import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double boxSize = 10.0;

class Tile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(border: Border.all()),
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: boxSize,
          minWidth: boxSize,
        ),
        child: new DecoratedBox(
          decoration: new BoxDecoration(color: Colors.black),
        ),
      ),
    );
  }
}
