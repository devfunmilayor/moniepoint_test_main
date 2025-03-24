import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final Interval interval;
  final bool scaleUp;

  const ScaleAnimation(
      {super.key,
      required this.child,
      required this.controller,
      required this.interval,
      this.scaleUp = true});

  @override
  Widget build(BuildContext context) {
    final Animation<double> scaleAnimation =
        Tween<double>(begin: scaleUp ? 0.0 : 1.0, end: scaleUp ? 1.0 : 0.0)
            .animate(
      CurvedAnimation(parent: controller, curve: interval),
    );

    return ScaleTransition(scale: scaleAnimation, child: child);
  }
}
