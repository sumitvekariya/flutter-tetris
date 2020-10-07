import 'tile.dart';

class AnimatedTile extends Tile {
  AnimatedTile({isSolid = false}) : super(2) {
    this.isSolid = isSolid;
  }
}
