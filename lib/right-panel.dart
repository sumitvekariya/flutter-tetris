import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tetris/digit.dart';
import 'package:tetris/store/store.dart';

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
    final tetris = Provider.of<TetrisStore>(context);

    List<Widget> _getListings({int n = 000000}) {
      List listings = List<Widget>();
      String digits = n.toString();
      int i = 0;
      for (i = 0; i < digits.length; i++) {
        int currentNum = int.parse(digits.substring(i, i + 1));
        listings.add(
          DigitalNumber(
            color: currentNum > -1 ? digitColor : paleDigitColor,
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

    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Score',
            // textScaleFactor: 1.3,
            textAlign: TextAlign.center,
          )
        ],
      ),
      SizedBox(
        height: 4,
      ),
      Observer(
          builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _getListings(
                n: tetris.points,
              ))),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
      Observer(
          builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _getListings(n: tetris.startLine),
              )),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getListings(n: 1),
      ),
      SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
      Container(
          width: 50,
          child: Observer(
              builder: (_) => Wrap(
                  direction: Axis.horizontal, children: tetris.nextWidget)))
    ]);
  }
}
