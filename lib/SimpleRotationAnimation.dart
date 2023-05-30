import 'package:flutter/material.dart';

class SimpleRotationAnimation extends StatefulWidget {
  @override
  _SimpleRotationAnimationState createState() =>
      _SimpleRotationAnimationState();
}

class _SimpleRotationAnimationState extends State<SimpleRotationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller!,
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.blue,
      ),
    );
  }
}
