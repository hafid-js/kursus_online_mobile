import 'package:flutter/material.dart';

class UCourseInformation extends StatelessWidget {
  const UCourseInformation({super.key, required this.information});

 final List<Map<String, dynamic>> information;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: information.map((info) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(info["icon"], color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    info["title"],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text(
                info["desc"],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}