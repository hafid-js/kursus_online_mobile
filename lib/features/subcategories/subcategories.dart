import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/course/widgets/instructor_section.dart';
import 'package:kursus_online_mobile/features/search/data/tags.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(backgroundColor: UColors.backgroundColor),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Design",
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
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 8,
              children: tags.map((tag) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 310,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 8),
                  ...List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  child: Image.asset(
                                    "assets/images/course_image_test.jpg",
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
                                    "30 Days to Learning Flutter",
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
                                    "Syam Sahril",
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
                                        "(4)",
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
                                    "Rp 199.000",
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
                  }),
                  SizedBox(width: 8),
                ],
              ),
            ),
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
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 8,
              children: tags.map((tag) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            USectionHeading(title: "Instructors"),

                    Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hafid",
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
                UCircularImage(image: "assets/images/instructor_8.jpg", isNetworkImage: true,),
              ],
            ),
            SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${4} Instructor rating",
                  style: TextStyle(color: Colors.white),
                ),
                Text("${210} Reviews", style: TextStyle(color: Colors.white)),
                Text("${3800} Students", style: TextStyle(color: Colors.white)),
                Text("${70} Courses", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    ),
          ],
        ),
        )
      ),
    );
  }
}
