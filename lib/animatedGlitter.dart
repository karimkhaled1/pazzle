
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedGlitter extends StatefulWidget {
  const AnimatedGlitter({
    Key key,
  }) : super(key: key);

  @override
  _AnimatedGlitterState createState() => _AnimatedGlitterState();
}

class _AnimatedGlitterState extends State<AnimatedGlitter>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..repeat(reverse: true);
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Stack(
        children: List.generate(2000, (index) {
          return Positioned(
            bottom:
                Random().nextInt(MediaQuery.of(context).size.height.toInt()) *
                    1.0,
            left: Random().nextInt(MediaQuery.of(context).size.width.toInt()) *
                1.0,
            child: Container(
              width: 3,
              height: 3,
              color: Color.fromRGBO(
                  Random().nextInt(255),
                  _animationController.value.toInt() * Random().nextInt(255),
                  _animationController.value.toInt() * Random().nextInt(255),
                  _animationController.value * 1),
            ),
          );
        }),
      ),
    );
  }
}