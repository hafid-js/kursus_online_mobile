import 'package:flutter/material.dart';

class UCourseHeader extends StatelessWidget {
  final String title;
  final String description;
  final double rating;
  final int ratingCount;
  final int students;

  const UCourseHeader({
    super.key,
    required this.title,
    required this.description,
    required this.rating,
    required this.ratingCount,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          description,
          style: const TextStyle(color: Colors.white),
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            Text(
              rating.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),

            const SizedBox(width: 4),

            Row(
              children: List.generate(
                5,
                (i) => Icon(
                  Icons.star_rounded,
                  size: 18,
                  color: i < rating.floor()
                      ? Colors.yellow[700]
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 4),

        Text(
          "($ratingCount ratings) $students students",
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}