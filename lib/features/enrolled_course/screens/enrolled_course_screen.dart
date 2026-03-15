
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_image.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/enrolled_course/controllers/enrolled_course_controller.dart';

class EnrolledCourseScreen extends StatelessWidget {
  EnrolledCourseScreen({super.key});

  final EnrolledCourseController controller = Get.put(EnrolledCourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        title: Text("My learning", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: true,
        backgroundColor: UColors.backgroundColor,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.enrolledCourses.isEmpty) {
          return Center(child: Text("No enrolled courses", style: TextStyle(color: Colors.white)));
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: controller.enrolledCourses.length,
            itemBuilder: (context, index) {
              final enrollment = controller.enrolledCourses[index];
              final course = enrollment.course;
              return GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      URoundedImage(
                        imageUrl: course.thumbnail,
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
                            Text(course.title,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                            SizedBox(height: 4),
                             Text(course.instructor?.name ?? 'No Instructor', style: TextStyle(fontSize: 10,color: Colors.white),),
                               SizedBox(height: 8),
                            // Container(
                            //   height: 5,
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     color: Color.fromARGB(99, 79, 79, 79),
                            //     borderRadius: BorderRadius.all(Radius.circular(30)),
                            //   ),
                            //   child: FractionallySizedBox(
                            //     alignment: Alignment.centerLeft,
                            //     widthFactor: 0.2,
                            //     child: Container(color: Colors.deepPurpleAccent),
                            //   ),
                            // ),
                            // SizedBox(height: 8),
                            Text('Start course', style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 13, fontWeight: FontWeight.bold)),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}