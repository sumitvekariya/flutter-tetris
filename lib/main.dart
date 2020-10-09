import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:tetris/interface/game-store.dart';
import 'package:tetris/sound/sound-manager.dart';
import 'package:tetris/store/store.dart';
import 'package:tetris/matrix.dart';
import 'package:tetris/right-panel.dart';
import 'package:tetris/side-decoration.dart';

void main() {
  runApp(TetrisApp());
}

class TetrisApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Provider<TetrisStore>(
      create: (_) => TetrisStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
      ));
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final TetrisStore tetriState = Provider.of<TetrisStore>(context);

    ReactionDisposer _disposer = reaction(
        (_) => tetriState.gameState == GameState.Over,
        (result) => displayDialog(context, tetriState),
        delay: 1000);

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
                  // decoration: BoxDecoration(border: Border.all()),
                  padding: EdgeInsets.fromLTRB(15, 40, 0, 0),
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
                              Observer(
                                builder: (_) => Container(
                                    foregroundDecoration:
                                        tetriState.gameState ==
                                                GameState.Loading
                                            ? BoxDecoration(
                                                image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'assets/img/pankhi.png'),
                                                fit: BoxFit.contain,
                                              ))
                                            : null,
                                    margin: EdgeInsets.all(3),
                                    width: MediaQuery.of(context).size.width *
                                        0.49,
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    // child: Transform(
                                    //   alignment: Alignment.center,
                                    //   transform: Matrix4.rotationY(math.pi),
                                    //   child: Logo(),
                                    // )),
                                    child: tetriState.matrix.length > 0
                                        ? MatrixView(tetriState)
                                        : Container()),
                              ),
                              Flexible(
                                // width: MediaQuery.of(context).size.width * 0.15,
                                // direction: Axis.vertical,
                                child: RightPanel(),
                                // decoration: BoxDecoration(border: Border.all()),
                              )
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
                  height: MediaQuery.of(context).copyWith().size.height * 0.32,
                  // color: Colors.blue,
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Observer(
                              builder: (_) => Ink(
                                    decoration: const ShapeDecoration(
                                      color: Colors.green,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        tetriState.gameState != null &&
                                                (tetriState.gameState ==
                                                        GameState.Loading ||
                                                    tetriState.gameState ==
                                                        GameState.Over ||
                                                    tetriState.gameState ==
                                                        GameState.Paused)
                                            ? Icons.play_arrow_rounded
                                            : Icons.pause_circle_filled,
                                        color: Colors.white,
                                      ),
                                      iconSize: 30,
                                      onPressed: tetriState.gameState ==
                                              GameState.Started
                                          ? tetriState.pause
                                          : tetriState.gameState ==
                                                  GameState.Paused
                                              ? tetriState.resume
                                              : tetriState.start,
                                    ),
                                  )),
                          SizedBox(width: 10),
                          Observer(
                              builder: (_) => Ink(
                                    decoration: const ShapeDecoration(
                                      color: Colors.green,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        tetriState.sound == true
                                            ? Icons.music_off_outlined
                                            : Icons.music_note,
                                        color: Colors.white,
                                      ),
                                      iconSize: 30,
                                      onPressed: tetriState.muteUnmute,
                                    ),
                                  )),
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
                              onPressed: tetriState.reset,
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
                                Icons.rotate_right,
                                color: Colors.white,
                              ),
                              iconSize: 55,
                              onPressed: tetriState.rotate,
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
                              onPressed: tetriState.drop,
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
                                onPressed: tetriState.moveLeft,
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
                                onPressed: tetriState.moveDown,
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
                                onPressed: tetriState.moveRight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

displayDialog(BuildContext context, TetrisStore tetriState) async {
  if (tetriState.gameState == GameState.Over) {
    showDialog(
        context: context,
        builder: (context) {
          final dialog = AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://statics.pampling.com/imagenes/disenos/diseno_77115.jpg'),
                      fit: BoxFit.cover)),
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  tetriState.reset();
                },
                child: Text('Restart'),
                color: Colors.amber,
                highlightColor: Colors.amber,
              )
            ],
          );
          return dialog;
        });
  }
}
