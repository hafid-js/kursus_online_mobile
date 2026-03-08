import 'package:flutter/material.dart';

class UReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;

  const UReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review["title"] ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Text(
                        "${review["avg_rating"] ?? 0}",
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
                            size: 14,
                            color: i < (review["ratings"] ?? 0)
                                ? Colors.yellow[700]
                                : Colors.grey,
                          ),
                        ),
                      ),

                      const SizedBox(width: 4),

                      Text(
                        "(${review["time"] ?? ""})",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    review["comment"] ?? "",
                    style: const TextStyle(color: Colors.white),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
