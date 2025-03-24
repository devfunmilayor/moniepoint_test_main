import 'package:flutter/material.dart';


class PopupOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Function()? onTap;

  const PopupOption({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}