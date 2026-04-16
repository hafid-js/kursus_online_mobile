import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_image.dart';
import 'package:kursus_online_mobile/common/widgets/texts/description.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/features/course/course.dart';
import 'package:kursus_online_mobile/features/course_detail/services/course_detail_service.dart';
import 'package:kursus_online_mobile/features/instructor/controllers/instructor_controller.dart';

class InstructorScreen extends StatelessWidget {
  InstructorScreen({super.key});

  final InstructorController controller = Get.put(InstructorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: UColors.backgroundColor,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.value != null) {
          return Center(
            child: Text(
              controller.errorMessage.value!,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        final data = controller.instructorCourses.value;

        if (data == null) {
          return Center(
            child: Text(
              "No Courses Found!",
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        final instructor = data.instructor;
        final courses = data.allCourses;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UCircularImage(
                      image: instructor.first.image,
                      isNetworkImage: true,
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            instructor.first.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Spectral",
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            instructor.first.headline,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Course students",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          instructor.first.studentsCount.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reviews",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          instructor.first.reviewsCount.toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                UDescription(
                  title: "About me",
                  description: instructor.first.bio,
                ),

                SizedBox(height: 20),
                USectionHeading(title: "My Courses (8)"),

                SizedBox(
                  height: 310,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      final course = courses[index];
                      return GestureDetector(
                        onTap: () async {
                          final courseDetail = await CourseDetailService().getCourse(
                      course.slug,
                    );

                    Get.to(() => CourseScreen(courseDetail: courseDetail, cartId: course.id));
                        },
                        child: Column(
                        children: [
                          Row(
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
                                    Text(
                                      course.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      course.instructorName ?? '',
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
                                            color: Colors.amber,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          course.reviewCount.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      height: 5,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          99,
                                          79,
                                          79,
                                          79,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: 0.7,
                                        child: Container(
                                          color: Colors.deepPurpleAccent,
                                        ),
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
                                      UHelperFunctions.formatRupiah(
                                        course.price,
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
