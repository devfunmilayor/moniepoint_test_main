import 'package:flutter/material.dart';
import 'package:moniepoint_test/config/theme/app_palette.dart';


class OptionBtnWidget extends StatelessWidget {
  const OptionBtnWidget({
    super.key,
    required this.icon,
    this.onTap,
  });

  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppPalette.grey.grey20.withOpacity(.8),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(15),
        child: Icon(
          icon,
          color: AppPalette.pureWhite,
          size: 25,
        ),
      ),
    );
  }
}