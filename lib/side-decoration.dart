import 'package:flutter/cupertino.dart';
import 'package:tetris/tile.dart';

const double emptyBoxSize = 16;

class SideDecoration extends StatelessWidget {
  final bool reverse;
  SideDecoration({Key key, @required this.reverse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RightSingleTile(reverse: this.reverse),
          DoubleTile(),
          LeftSingleTile(reverse: this.reverse),
          SizedBox(height: emptyBoxSize),
          LeftSingleTile(reverse: this.reverse),
          DoubleTile(),
          LeftSingleTile(reverse: this.reverse),
          SizedBox(height: emptyBoxSize),
          DoubleTile(),
          DoubleTile(),
          SizedBox(height: emptyBoxSize),
          RightSingleTile(reverse: this.reverse),
          DoubleTile(),
          RightSingleTile(reverse: this.reverse),
          SizedBox(height: emptyBoxSize),
          DoubleTile(),
          RightSingleTile(reverse: this.reverse),
          RightSingleTile(reverse: this.reverse),
          SizedBox(height: emptyBoxSize),
          LeftSingleTile(reverse: this.reverse),
          LeftSingleTile(reverse: this.reverse),
          LeftSingleTile(reverse: this.reverse),
          LeftSingleTile(reverse: this.reverse),
        ],
      ),
    );
  }
}

class LeftSingleTile extends StatelessWidget {
  final bool reverse;
  LeftSingleTile({Key key, @required this.reverse}) : super(key: key);

  final List<Widget> leftSingle = [
    Tile(),
    SizedBox(
      width: emptyBoxSize,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: this.reverse ? leftSingle.reversed.toList() : leftSingle,
    );
  }
}

class RightSingleTile extends StatelessWidget {
  final bool reverse;
  RightSingleTile({Key key, @required this.reverse}) : super(key: key);

  final List<Widget> rightSingle = [
    SizedBox(
      width: emptyBoxSize,
    ),
    Tile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: this.reverse ? rightSingle.reversed.toList() : rightSingle,
    );
  }
}

class DoubleTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [Tile(), Tile()],
        )
      ],
    );
  }
}
