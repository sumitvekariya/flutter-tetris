import 'tile.dart';

class FilledTile extends Tile {
  FilledTile({isSolid = false, bool isSmall}) : super(1, isSmall: isSmall) {
    this.isSolid = isSolid;
  }
}
