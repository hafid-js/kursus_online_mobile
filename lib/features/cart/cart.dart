import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kursus_online_mobile/common/widgets/cards/course_card.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/cart/data/cart.dart';
import 'package:kursus_online_mobile/features/course/course.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
              backgroundColor: UColors.backgroundColor,
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
         bottom: PreferredSize(
    preferredSize: Size.fromHeight(1),
    child: Divider(
      height: 1,
      thickness: 1,
      color: const Color.fromARGB(94, 158, 158, 158),
    )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: GestureDetector(
            onTap: () => Get.to(() => CourseScreen()),
            child: Column(
            children: courses.map((course) {
              return UCourseCard(course: course);
            }).toList(),
          ),
          )
        ),
      ),
    );
  }
}


