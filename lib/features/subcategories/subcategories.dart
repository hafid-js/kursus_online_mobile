import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_image.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/features/subcategories/controllers/get_by_category_controller.dart';
import 'package:kursus_online_mobile/features/subcategories/data/popular_topics.dart';

class SubCategoriesScreen extends StatelessWidget {
  SubCategoriesScreen({super.key});


  final GetByCategoryController controller = Get.put(GetByCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(backgroundColor: UColors.backgroundColor),
      body: Obx(() {

        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        
        final data = controller.getByCategory.value;
         if (controller.errorMessage.value != null) {
    return Center(
      child: Text(
        controller.errorMessage.value!,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

        
         if (data == null) {
          return Center(
            child: Text(
              "No Sub Category Found!",
              style: TextStyle(color: Colors.white),
            ),
          );
        } 
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.categoryName.name,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Spectral',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Subcategories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: data.subCategories
                                .sublist(
                                  0,
                                  (data.subCategories.length / 2).ceil(),
                                )
                                .map((sub) => _chip(sub.name))
                                .toList(),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: data.subCategories
                                .sublist((data.subCategories.length / 2).ceil())
                                .map((sub) => _chip(sub.name))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  USectionHeading(
                    title: "Courses to get you started",
                    titleSize: 22,
                  ),
                  SizedBox(
                    height: 310,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.coursesGetStarted.length + 1,
                      itemBuilder: (context, index) {
                        if (index == data.coursesGetStarted.length) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {
              // TODO: aksi ketika klik See All
            },
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
                        final course = data.coursesGetStarted[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SizedBox(
                            width: 320,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  SizedBox(width: 8),

                  SizedBox(height: 12),
                  Text(
                    "Popular Topics",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: popularTopics
                                .sublist(0, (popularTopics.length / 2).ceil())
                                .map((topics) => _chip(topics))
                                .toList(),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: popularTopics
                                .sublist((popularTopics.length / 2).ceil())
                                .map((topics) => _chip(topics))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  USectionHeading(title: "Popular Instructors", titleSize: 25),

                  SizedBox(
                    height: 180,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                    itemCount: data.popularInstructor.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2, mainAxisSpacing: 12.0, crossAxisSpacing: 1.4, childAspectRatio: 0.32),
                    itemBuilder: (context, index) {
                      final instructor = data.popularInstructor[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              UCircularImage(
                                image: instructor.image,
                                isNetworkImage: true,
                              ),
                          SizedBox(width: 12),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                instructor.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                instructor.headline,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${instructor.studentsCount} Students",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${instructor.coursesCount} Courses",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                                                      ],
                          ),
                        ],
                      );
                    },
                    ),
                  ),

                  SizedBox(height: 20),
                  USectionHeading(title: "All Courses", titleSize: 25),

                  SizedBox(
                    height: 310,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.allCourses.length,
                      itemBuilder: (context, index) {
                        final course = data.allCourses[index];
                        return Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      
    ));
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
