import 'package:flutter/material.dart';

class RequirementsSection extends StatelessWidget {
  const RequirementsSection({super.key, required this.requirements});

  final List<Map<String, String>> requirements;

  @override
  Widget build(BuildContext context) {
    final GlobalKey requirementsKey = GlobalKey();
    return Column(
      children: [
        Row(
          key: requirementsKey,
          children: [
            Text(
              "Requirements",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: requirements.map((req) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              minLeadingWidth: 0,
              visualDensity: VisualDensity(vertical: 4),
              leading:
               Text(
                "•",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              title: Text(
                req['requirement'] ?? "",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            );
          }).toList()
        ),
      ],
    );
  }
}
