import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_image.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/course_model.dart';

class UCourseCard extends StatelessWidget {
   final CourseDetailModel courseDetail;
   
  const UCourseCard({
    super.key, required this.courseDetail,
   
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedImage(
              imageUrl: courseDetail.thumbnail,
              isNetworkImage: true,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
              borderRadius: 6,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseDetail.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    courseDetail.instructor?.name ?? '',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                                 color: Colors.amber
                        ),
                      ),
                      SizedBox(width: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          5,
                          (i) => Icon(
                            Icons.star_rounded,
                            size: 18,
                            color: i < 4
                                ? Colors.yellow[700]
                                : Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "(${courseDetail.studentCount})",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Container(
                          height: 5,
                          width: 300,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(99, 79, 79, 79),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.7,
                            child: Container(color: Colors.deepPurpleAccent),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '46% complete',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 11,
                          ),
                        ),
                  SizedBox(height: 4),
                  Text(
                    UHelperFunctions.formatRupiah(4300),
                    style: TextStyle(fontWeight: FontWeight.bold,        color: Colors.white),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
