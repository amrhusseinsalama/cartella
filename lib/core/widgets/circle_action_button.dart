import 'package:flutter/material.dart';

class CircleActionButton extends StatelessWidget {
  const CircleActionButton({
    super.key,
    required this.icon,
    required this.iconColor,
    this.backgroundColor,
    required this.onPressed,
  });
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        elevation: 3,
        shadowColor: Colors.black,
        backgroundColor: backgroundColor,
        shape: CircleBorder(),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: iconColor, size: 27),
    );
  }
}
