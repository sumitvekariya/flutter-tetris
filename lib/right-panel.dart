import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tetris/digit.dart';
import 'package:tetris/tile.dart';

final Color digitColor = Colors.black;
final Color paleDigitColor = Colors.grey[400];
final double demoTileSize = 8.0;

class RightPanel extends StatefulWidget {
  @override
  _RightPanelState createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _getListings({int n = 000000}) {
      List listings = List<Widget>();
      String digits = n.toString();
      int i = 0;
      for (i = 0; i < digits.length; i++) {
        int currentNum = int.parse(digits.substring(i, i + 1));
        listings.add(
          DigitalNumber(
            color: currentNum > 0 ? digitColor : paleDigitColor,
            height: 20,
            value: currentNum,
          ),
        );
        listings.add(
          SizedBox(
            width: 2,
          ),
        );
      }
      return listings;
    }

    List<Widget> _getTiles(int n) {
      List listings = List<Widget>();
      int i = 0;
      for (i = 0; i < n; i++) {
        listings.add(
          Tile(
            size: demoTileSize,
            isPale: true,
          ),
        );
      }
      return listings;
    }

    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text(
            'Max',
            // textScaleFactor: 1.3,
            textAlign: TextAlign.start,
          )
        ],
      ),
      SizedBox(
        height: 4,
      ),
      Row(
        children: _getListings(n: 11111),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        children: [
          Text(
            'Start Line',
            textAlign: TextAlign.start,
          )
        ],
      ),
      SizedBox(
        height: 4,
      ),
      Row(
        children: _getListings(),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        children: [
          Text(
            'Level',
            textAlign: TextAlign.start,
          )
        ],
      ),
      SizedBox(
        height: 4,
      ),
      Row(
        children: _getListings(n: 1),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        children: [
          Text(
            'Next',
            textAlign: TextAlign.start,
          )
        ],
      ),
      SizedBox(
        height: 4,
      ),
      Column(
        children: [
          Row(
            children: _getTiles(4),
          ),
          Row(
            children: _getTiles(4),
          )
        ],
      )
    ]);
  }
}
