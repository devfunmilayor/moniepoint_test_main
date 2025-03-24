import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final Interval interval;
  final bool fadeIn;

  const FadeAnimation({super.key, required this.child, required this.controller, required this.interval,  this.fadeIn = true});

  @override
  Widget build(BuildContext context) {
    final Animation<double> fadeAnimation = Tween<double>(
      begin: fadeIn ? 0.0 : 1.0, // Adjust based on fadeIn or fadeOut
      end: fadeIn ? 1.0 : 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: interval, // Pass the Interval for fade timing
      ),
    );

    return FadeTransition(
      opacity: fadeAnimation,
      child: child,
    );
  }
}
