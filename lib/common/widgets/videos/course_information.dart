import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';

class UCourseInformation extends StatelessWidget {
  const UCourseInformation({super.key, required this.duration, required this.level, required this.studentEnrolled, required this.language});

  final String duration;
  final String level;
  final String studentEnrolled;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.watch_later_outlined, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Course Duration",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                UHelperFunctions.formatDuration(duration),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.signal_cellular_alt_rounded, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Skill Level",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                level,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.supervisor_account_outlined, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Student Enrolled",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                studentEnrolled.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.translate_rounded, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "Language",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                language,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
      ]
        ),
      
    );
  }
}