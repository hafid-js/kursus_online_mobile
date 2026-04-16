import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/instructor_model.dart';

class InstructorSection extends StatelessWidget {
  const InstructorSection({super.key, required this.rating, required this.instructor, required this.studentCount, required this.courseCount});

  final double rating;
  final InstructorModel? instructor;
  final String studentCount;
   final String courseCount;

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
                  instructor!.name,
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
                UCircularImage(image: instructor!.image, isNetworkImage: true,),
              ],
            ),
            SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$rating Instructor rating",
                  style: TextStyle(color: Colors.white),
                ),
                Text("${instructor!.reviewCount.length} Reviews", style: TextStyle(color: Colors.white)),
                Text("$studentCount Students", style: TextStyle(color: Colors.white)),
                Text("$courseCount Courses", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
