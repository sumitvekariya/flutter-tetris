import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return RotationTransition(
        // alignment: Alignment(-10, 0),
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/bg.png',
              width: 210,
              height: 85,
              alignment: Alignment(0.3, 1),
              // height: double.minPositive,
              fit: BoxFit.none,
              // height: 20,
              scale: 2,
              // alignment: Alignment(20, 0),
            )
          ],
        ));
  }
}
