import 'package:flutter/material.dart';

class URatingBar extends StatelessWidget {
  final double progress;
  final int stars;
  final String percent;

  const URatingBar({
    super.key,
    required this.progress,
    required this.stars,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            height: 18,
            width: 260,
            color: const Color.fromARGB(99, 79, 79, 79),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                color: const Color.fromARGB(129, 79, 79, 79),
              ),
            ),
          ),
          const SizedBox(width: 8),

          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (i) => Icon(
                    Icons.star_rounded,
                    size: 14,
                    color: i < stars ? Colors.yellow[700] : Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 4),

              Text(
                percent,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}