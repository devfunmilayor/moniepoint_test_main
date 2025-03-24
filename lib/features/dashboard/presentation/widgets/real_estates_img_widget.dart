import 'package:flutter/material.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';
import 'package:moniepoint_test/core/animations/fade_animation.dart';
import 'package:moniepoint_test/core/animations/reveal_animation.dart';
import 'package:moniepoint_test/core/animations/scale_transition.dart';


class RealEstatesWidget extends StatelessWidget {
  const RealEstatesWidget({
    super.key,
    required this.image, required this.index, required this.controller, required this.containerInterval, required this.textInterval, required this.arrowInterval,
  });

  final String image;
  final int index;
  final AnimationController controller;
  final Interval containerInterval;
  final Interval textInterval;
  final Interval arrowInterval;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: RevealAnimation(
            controller: controller,
            interval: containerInterval,
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppPalette.pureWhite.withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 100; // Adjust the width threshold as needed

                  return Row(
                    mainAxisAlignment: isWide ? MainAxisAlignment.center : MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FadeAnimation(
                          controller: controller,
                          interval: textInterval,
                          child: Text(
                            'Address, ${index + 1}',
                            textAlign: isWide ? TextAlign.center : TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      ScaleAnimation(
                        controller: controller,
                        interval: arrowInterval,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 10,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}