// Flutter 패키지를 가져옵니다.
import 'package:flutter/material.dart';

// StatefulWidget인 SimpleRotationAnimation을 정의합니다.
class SimpleRotationAnimation extends StatefulWidget {
  // 생성자에서 Key를 선택적으로 받도록 합니다.
  const SimpleRotationAnimation({Key? key}) : super(key: key);

  // 상태를 생성하는 메서드를 오버라이드합니다.
  @override
  SimpleRotationAnimationState createState() => SimpleRotationAnimationState();
}

// SimpleRotationAnimation의 상태를 정의하는 클래스입니다.
// 이 클래스는 SingleTickerProviderStateMixin을 사용하며,
// 이는 애니메이션 컨트롤러를 위한 ticker를 제공합니다.
class SimpleRotationAnimationState extends State<SimpleRotationAnimation>
    with SingleTickerProviderStateMixin {
  // AnimationController를 정의합니다. 이 컨트롤러는 애니메이션을 제어합니다.
  AnimationController? _controller;
  double _size = 100.0;

  void scaleUp(double newSize) {
    setState(() {
      _size = newSize;
    });
  }

  // speedUp 함수를 정의합니다. 이 함수는 애니메이션의 속도를 빠르게 합니다.
  // 이 함수는 새로운 duration 값을 받아서 컨트롤러의 duration을 변경하고 애니메이션을 재시작합니다.
  void speedUp(duration) {
    setState(() {
      _controller!.duration = Duration(seconds: duration);
      _controller!.repeat();
    });
  }

  // initState 메서드를 오버라이드합니다.
  // 이 메서드는 위젯이 생성될 때 호출됩니다.
  // 여기서 AnimationController를 초기화하고 애니메이션을 시작합니다.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  // dispose 메서드를 오버라이드합니다.
  // 이 메서드는 위젯이 제거될 때 호출됩니다.
  // 여기서 AnimationController를 dispose하여 리소스를 해제합니다.
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  // build 메서드를 오버라이드합니다.
  // 이 메서드는 위젯의 UI를 빌드합니다.
  // 여기서는 RotationTransition을 사용하여 회전 애니메이션을 적용한 컨테이너를 반환합니다.
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller!,
      child: Container(
        width: _size,
        height: _size,
        color: Colors.blue,
      ),
    );
  }
}
