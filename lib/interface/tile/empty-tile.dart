import 'tile.dart';

class EmptyTile extends Tile {
  EmptyTile({bool isSmall}) : super(0, isSmall: isSmall) {
    this.isSolid = false;
  }
}
