import 'package:flutter/material.dart';

class NumberAnimation extends StatelessWidget {
  final int start;
  final int end;
  final AnimationController controller;
  final Interval interval;
  final TextStyle? textStyle;

  const NumberAnimation({super.key,
    required this.start,
    required this.end,
    required this.controller,
    required this.interval,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final Animation<int> numberAnimation = IntTween(
      begin: start,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: interval, // Control when the number animation happens
      ),
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Text(
          numberAnimation.value.toString(),
          style: textStyle ?? Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
