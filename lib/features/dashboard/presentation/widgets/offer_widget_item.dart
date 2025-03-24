import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/animations/number_animation.dart';


class OfferCard extends StatelessWidget {
  final String title;
  final int offers;
  final Color backgroundColor;
  final Color textColor;
  final bool isRounded;
  final AnimationController controller;
  final Interval interval;

  const OfferCard({super.key, 
    required this.title,
    required this.offers,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.white,
    this.isRounded = false, required this.controller, required this.interval,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: isRounded ? null : BorderRadius.circular(16),
          shape: isRounded ? BoxShape.circle : BoxShape.rectangle
      ),
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NumberAnimation(
                start: 1,
                end: offers,
                controller: controller,
                interval: interval,
                textStyle:  TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                'offers',
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}