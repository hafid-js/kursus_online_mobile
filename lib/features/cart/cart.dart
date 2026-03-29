import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kursus_online_mobile/common/widgets/cards/course_card.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/cart/data/cart.dart';
import 'package:kursus_online_mobile/features/cart/models/cart_model.dart';
import 'package:kursus_online_mobile/features/cart/services/cart_service.dart';
import 'package:kursus_online_mobile/features/course/course.dart';
import 'package:kursus_online_mobile/features/course_detail/course_detail.dart';
import 'package:kursus_online_mobile/features/course_detail/services/course_detail_service.dart';

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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: const Color.fromARGB(94, 158, 158, 158),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: FutureBuilder<List<CartModel>>(
          future: CartService().getCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            final carts = snapshot.data!;

            if (carts.isEmpty) {
              return Center(child: Text("Cart is Empty"));
            }
            

            return ListView.builder(
              shrinkWrap: true,
              itemCount: carts.length,
              itemBuilder: (context, index) {
                final cart = carts[index];

                return GestureDetector(
                  onTap: () async {
                    final courseDetail = await CourseDetailService().getCourse(
                      cart.courseDetail.slug,
                    );

                    Get.to(() => CourseScreen(courseDetail: courseDetail));
                  },
                  child: UCourseCard(courseDetail: cart.courseDetail),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
