import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';

class InstructorSection extends StatelessWidget {
  const InstructorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chad Darby",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Popular Java Spring Instructor - Best Seller",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UCircularImage(image: "assets/images/instructor_8.jpg"),
              ],
            ),
            SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "4.6 Instructor rating",
                  style: TextStyle(color: Colors.white),
                ),
                Text("173.729 Reviews", style: TextStyle(color: Colors.white)),
                Text("912.688 Students", style: TextStyle(color: Colors.white)),
                Text("16 Courses", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
