
import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;

  const AppbarIcon({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.grey.shade200,
        child: Icon(
          iconData,
          color: Colors.grey,
          size: 24,

        ),
      ),
    );
  }
}