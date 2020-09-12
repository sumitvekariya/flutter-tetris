import 'package:flutter/material.dart';
import 'package:tetris/digit.dart';
import 'package:tetris/logo.dart';
import 'package:tetris/right-panel.dart';
import 'package:tetris/side-decoration.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tetris',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        backgroundColor: Colors.amberAccent,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Tetris'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Flex(
          direction: Axis.vertical,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 50, 0, 15),
                  height: MediaQuery.of(context).copyWith().size.height * 0.68,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      SideDecoration(
                        reverse: false,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                        width:
                            MediaQuery.of(context).copyWith().size.width * 0.70,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(border: Border.all()),
                        child: new DecoratedBox(
                          decoration:
                              new BoxDecoration(color: Colors.lightGreen[100]),
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(3),
                                  decoration:
                                      BoxDecoration(border: Border.all()),
                                  child: Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Logo(),
                                  )),
                              Container(child: RightPanel())
                            ],
                          ),
                        ),
                      ),
                      SideDecoration(
                        reverse: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    height:
                        MediaQuery.of(context).copyWith().size.height * 0.32,
                    // color: Colors.blue,
                    child: Column(
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.green,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.pause_circle_filled,
                                  color: Colors.white,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            SizedBox(width: 10),
                            Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.green,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.music_note,
                                  color: Colors.white,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            SizedBox(width: 10),
                            Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.red,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.restore,
                                  color: Colors.white,
                                ),
                                iconSize: 30,
                                onPressed: null,
                              ),
                            ),
                            SizedBox(width: 80),
                            Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.deepPurpleAccent,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                iconSize: 55,
                                onPressed: null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 30),
                            Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.deepPurpleAccent,
                                shape: CircleBorder(),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                                iconSize: 90,
                                onPressed: null,
                              ),
                            ),
                            SizedBox(width: 35),
                            Container(
                              transform: Matrix4.translationValues(5, -25, 0),
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_left,
                                    color: Colors.white,
                                  ),
                                  iconSize: 55,
                                  onPressed: null,
                                ),
                              ),
                            ),
                            // SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 35, 0, 0),
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: 55,
                                  onPressed: null,
                                ),
                              ),
                            ),
                            // SizedBox(width: 5),
                            Container(
                              transform: Matrix4.translationValues(-3, -27, 0),
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.deepPurpleAccent,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                  iconSize: 55,
                                  onPressed: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            )
          ],
        )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
