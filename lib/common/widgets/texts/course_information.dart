import 'package:flutter/material.dart';

class UCourseInformation extends StatelessWidget {
  final List<CourseInfo> information;

  const UCourseInformation({
    super.key,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: information.map((info) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(info.icon, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    info.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                info.desc,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class CourseInfo {
  final IconData icon;
  final String title;
  final String desc;

  CourseInfo({
    required this.icon,
    required this.title,
    required this.desc,
  });
}