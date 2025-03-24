import 'dart:math';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';
import 'package:moniepoint_test/core/animations/fade_animation.dart';
import 'package:moniepoint_test/core/animations/scale_transition.dart';

class RandomPositionedContainers extends StatelessWidget {
  final int itemCount = 10; // Number of containers
  final double containerSize = 50.0;
  final AnimationController controller;
  final Interval containerInterval;
  final Interval childInterval;

  const RandomPositionedContainers({super.key, required this.controller, required this.childInterval, required this.containerInterval}); // Size of each container

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    final screenSize = MediaQuery.of(context).size;

    // Create a list of random positions for the containers
    final random = Random();
    final List<Widget> positionedContainers = List.generate(itemCount, (index) {
      // Generate random x and y coordinates within the screen bounds
      final x = random.nextDouble() * (screenSize.width - containerSize);
      final y = random.nextDouble() * (screenSize.height - containerSize);

      return Positioned(
        left: x,
        top: y,
        child: ScaleAnimation(
          controller: controller,
          interval: containerInterval,
          child: Container(
            width: containerSize,
            height: containerSize,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
              color: AppPalette.primary,
            ),
            child: FadeAnimation(
                controller: controller,
                interval: childInterval,
                child: const Center(child: Icon(Icons.holiday_village, color: AppPalette.pureWhite, size: 20,))),
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, ),
          child: Stack(
            children: positionedContainers,
          ),
        ),
      ),
    );
  }
}