import 'package:flutter/material.dart';

enum RevealDirection { leftToRight, downToUp }
class RevealAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final Interval interval;
  final RevealDirection direction;

  const RevealAnimation({super.key, required this.child, required this.controller, required this.interval,  this.direction = RevealDirection.leftToRight});

  @override
  Widget build(BuildContext context) {
    // Set the initial offset based on the chosen direction
    Offset beginOffset;
    switch (direction) {
      case RevealDirection.leftToRight:
        beginOffset = const Offset(-1.0, 0.0); // Start off-screen to the left
        break;
      case RevealDirection.downToUp:
        beginOffset = const Offset(0.0, 1.0); // Start off-screen below
        break;
    }

    final Animation<Offset> slideAnimation = Tween<Offset>(
      begin: beginOffset, // Start from left (offscreen)
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: interval, // Pass the Interval for slide timing
      ),
    );

    return SlideTransition(
      position: slideAnimation,
      child: child,
    );
  }
}
