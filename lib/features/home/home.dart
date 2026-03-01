import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kursus_online_mobile/common/widgets/button/elevated_button.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/home/models/category_model.dart';
import 'package:kursus_online_mobile/features/home/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
        title: "Digital Marketing",
        course: "0 Course",
        icon: "assets/icons/category_icon_1.png",
      ),
      CategoryModel(
        title: "Health & Fitness",
        course: "1 Course",
        icon: "assets/icons/category_icon_2.png",
      ),
      CategoryModel(
        title: "Motion Graphics",
        course: "0 Course",
        icon: "assets/icons/category_icon_3.png",
      ),
      CategoryModel(
        title: "HTML & CSS",
        course: "3 Course",
        icon: "assets/icons/category_icon_4.png",
      ),
      CategoryModel(
        title: "Adobe Illustrator",
        course: "7 Course",
        icon: "assets/icons/category_icon_5.png",
      ),
      CategoryModel(
        title: "Business Strategy",
        course: "7 Course",
        icon: "assets/icons/category_icon_6.png",
      ),
      CategoryModel(
        title: "Mobile App Design",
        course: "7 Course",
        icon: "assets/icons/category_icon_7.png",
      ),
      CategoryModel(
        title: "Development",
        course: "7 Course",
        icon: "assets/icons/category_icon_8.png",
      ),
    ];

    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 1, right: 1),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: HexColor.fromHex("#d5f8ef"),
                child: Padding(
                  padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
                  child: Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.green, width: 0),
                        ),
                        elevation: 0,
                        color: HexColor.fromHex("#20c997"),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Image.asset(
                            "assets/icons/sarjana.png",
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Learn From Experts",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "LMS allows users to create organize and manage courses.",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 4),
              Card(
                color: HexColor.fromHex("#ffe5f4"),
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
                  child: Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: Colors.green, width: 0),
                        ),
                        elevation: 0,
                        color: HexColor.fromHex("#d63384"),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Image.asset(
                            "assets/icons/lencana.png",
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Earn a Certificate",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "LMS allows users to create organize and manage courses.",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 4),
              Card(
                elevation: 0,
                color: HexColor.fromHex("#d8f6ff"),
                child: Padding(
                  padding: EdgeInsets.only(left: 6, top: 6, bottom: 6),
                  child: Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.green, width: 0),
                        ),
                        elevation: 0,
                        color: HexColor.fromHex("#0dcaf0"),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Image.asset(
                            "assets/icons/video_screen.png",
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Features 5400+ Courses",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "LMS allows users to create organize and manage courses.",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12),
              USectionHeading(title: "Categories"),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 2,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final item = categories[index];

                  return CategoryCard(
                    title: item.title,
                    course: item.course,
                    icon: item.icon,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Nanti buat lihat categories"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex("#356DF1"),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "View All Categories",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios_rounded, size: 12),
                    ],
                  ),
                ),
              ),

              USectionHeading(title: "Featured Courses", buttonTitle: "View All"),

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
                          width: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  "assets/images/course_image_test.jpg",
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 6),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                        SizedBox(width: 6),
                                        Text(
                                          "(4.0) Rating",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      "30 Days to Learning Flutter",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.my_library_books,
                                              size: 12,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "5 Lessons",
                                              style: TextStyle(fontSize: 8),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.supervisor_account_outlined,
                                              size: 12,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              "1 Student",
                                              style: TextStyle(fontSize: 8),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        UCircularImage(
                                          image:
                                              "assets/images/instructor_8.jpg",
                                          isNetworkImage: false,
                                          height: 30,
                                          width: 30,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          "Kim Jong Un",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(thickness: 1, color: Colors.grey[300]),

                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 32,
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          side: BorderSide(
                                            color: Colors.black,
                                            width: 1,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                        ),
                                        child: Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Spacer(),

                                    Text(
                                      "Rp.550.000",
                                      style: TextStyle(
                                        fontSize: 12,
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

              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, bottom: 30),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Nanti buat lihat categories"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex("#356DF1"),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Browse More Courses",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward_ios_rounded, size: 12),
                    ],
                  ),
                ),
              ),


              
            ],
          ),
        ),
      ),
    );
  }
}
