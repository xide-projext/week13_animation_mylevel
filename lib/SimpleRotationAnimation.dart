import 'package:flutter/material.dart';

class SimpleRotationAnimation extends StatefulWidget {
  const SimpleRotationAnimation({Key? key}) : super(key: key);

  @override
  SimpleRotationAnimationState createState() => SimpleRotationAnimationState();
}

class SimpleRotationAnimationState extends State<SimpleRotationAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  void speedUp(duration) {
    setState(() {
      _controller!.duration = Duration(seconds: duration);
      _controller!.repeat();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
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
