
import 'package:flutter/material.dart';

class CourseMoreMenu extends StatelessWidget {
  const CourseMoreMenu({super.key, required this.icon, required this.title,this.onTap});

  final IconData icon;
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 16),
            Text(title, style: TextStyle(color: Colors.white)),
          ],
        ),
        SizedBox(height: 14),
      ],
    ),
    );
  }
}
