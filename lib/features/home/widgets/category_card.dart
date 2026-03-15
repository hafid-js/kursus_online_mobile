import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String course;
  final String icon;

  const CategoryCard({
    super.key,
    required this.title,
    required this.course,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return
    // Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Card(
    //         elevation: 0,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(8),
    //           side: BorderSide(color: Colors.grey, width: 1),
    //         ),
    //         color: Colors.grey[100],
    //         child: Padding(
    //           padding: EdgeInsets.all(8),
    //           child: Image.asset(
    //             icon,
    //             height: 30,
    //             width: 30,
    //           ),
    //         ),
    //       ),
    //       SizedBox(height: 8),
    //       Text(
    //         title,
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           fontSize: 12,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       SizedBox(height: 2),
    //       Text(
    //         course,
    //         style: TextStyle(
    //           fontSize: 10,
    //           color: Colors.grey,
    //         ),
    //       ),
    //     ],
    // );
    Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Card(
      color: HexColor.fromHex("#e2ebfe"),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: SizedBox(
        height: 60,
        width: 60,
        child: Center(
          child: Image.asset(
            icon,
            width: 28,
            color: Colors.grey[900],
          ),
        ),
      ),
    ),
    const SizedBox(height: 2),
    SizedBox(
      width: 70,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
    ),
  ],
);
  }
}
