import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final MaterialColor color;
  final IconData icon;
  const IconCard({
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.shade400.withOpacity(.35),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}
