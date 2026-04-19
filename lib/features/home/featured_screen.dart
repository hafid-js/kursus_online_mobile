import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/home/controllers/featured_controller.dart';

class FeaturedScreen extends StatelessWidget {
  FeaturedScreen({super.key});

  final FeaturedController controller = Get.put(FeaturedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: UColors.backgroundColor,
        toolbarHeight: -10,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final data = controller.getByCategory.value;
        if (data == null) {
          return Center(
            child: Text("No Data", style: TextStyle(color: Colors.white)),
          );
        }
        final courses = data.allCourses;
        final showSeeAll = courses.length > 1;

        if (controller.errorMessage.value != null) {
          return Center(
            child: Text(
              controller.errorMessage.value!,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (data.allCourses.isEmpty) {
          return Center(
            child: Text(
              "No Sub Category Found!",
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 16),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  visualDensity: VisualDensity(vertical: 4),
                  leading: UCircularImage(
                    image: "assets/images/instructor_8.jpg",
                  ),
                  title: Text("Welcome, Kim Jong Un"),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  subtitle: Text("Edit occupation and interests"),
                  subtitleTextStyle: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                USectionHeading(title: "Recommended for you", titleSize: 22),
                SizedBox(
                  height: 310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: showSeeAll ? courses.length + 1 : courses.length,
                    itemBuilder: (context, index) {
                      if (index == data.allCourses.length) {
                        if (showSeeAll && index == courses.length) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }
                      final course = data.allCourses[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SizedBox(
                          width: courses.length == 1 ? 380 : 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      course.thumbnail,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      course.instructorName ?? '',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 6),

                                    Row(
                                      children: [
                                        ...List.generate(
                                          5,
                                          (i) => Icon(
                                            Icons.star_rounded,
                                            size: 12,
                                            color: i < 4
                                                ? Colors.yellow[700]
                                                : Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          course.reviewCount.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 6),
                                    Text(
                                      "Rp. ${course.price.toString()}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                USectionHeading(
                  title: "Categories",
                  titleSize: 22,
                  showActionButton: true,
                  buttonTitle: "See all",
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: data.categories
                            .sublist(0, (data.categories.length / 2).ceil())
                            .map((sub) => _chip(sub.name))
                            .toList(),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: data.categories
                            .sublist((data.categories.length / 2).ceil())
                            .map((sub) => _chip(sub.name))
                            .toList(),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                USectionHeading(
                  title:
                      "Because you enrolled in Laravel 11 = Build a Complete Learning Management System LMS",
                  titleSize: 20,
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: showSeeAll ? courses.length + 1 : courses.length,
                    itemBuilder: (context, index) {
                      if (index == data.allCourses.length) {
                        if (showSeeAll && index == courses.length) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }
                      final course = data.allCourses[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SizedBox(
                          width: courses.length == 1 ? 380 : 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      course.thumbnail,
                                      height: 130,
                                      width: 230,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      course.instructorName ?? '',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 6),

                                    Row(
                                      children: [
                                        ...List.generate(
                                          5,
                                          (i) => Icon(
                                            Icons.star_rounded,
                                            size: 12,
                                            color: i < 4
                                                ? Colors.yellow[700]
                                                : Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          course.reviewCount.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 6),
                                    Text(
                                      "Rp. ${course.price.toString()}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

Widget _chip(String text) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

