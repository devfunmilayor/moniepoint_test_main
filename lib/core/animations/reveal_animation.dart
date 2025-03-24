import 'package:flutter/material.dart';

enum RevealDirection { leftToRight, downToUp }

class RevealAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final Interval interval;
  final RevealDirection direction;

  const RevealAnimation(
      {super.key,
      required this.child,
      required this.controller,
      required this.interval,
      this.direction = RevealDirection.leftToRight});

  @override
  Widget build(BuildContext context) {
    Offset beginOffset;
    switch (direction) {
      case RevealDirection.leftToRight:
        beginOffset = const Offset(-1.0, 0.0);
        break;
      case RevealDirection.downToUp:
        beginOffset = const Offset(0.0, 1.0);
        break;
    }

    final Animation<Offset> slideAnimation =
        Tween<Offset>(begin: beginOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: interval),
    );

    return SlideTransition(position: slideAnimation, child: child);
  }
}
