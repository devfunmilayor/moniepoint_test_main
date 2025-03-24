import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final Interval interval;
  final bool scaleUp; // Add a boolean flag to determine the direction

  const ScaleAnimation({super.key, 
    required this.child,
    required this.controller,
    required this.interval,
    this.scaleUp = true, // Default to scale up
  });

  @override
  Widget build(BuildContext context) {
    final Animation<double> scaleAnimation = Tween<double>(
      begin: scaleUp ? 0.0 : 1.0, // Start from 0 for scale-up, 1 for scale-down
      end: scaleUp ? 1.0 : 0.0,   // End at 1 for scale-up, 0 for scale-down
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: interval,
      ),
    );

    return ScaleTransition(
      scale: scaleAnimation,
      child: child,
    );
  }
}
