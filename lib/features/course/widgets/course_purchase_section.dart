import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/buttons/elevated_button_zero_radius.dart';
import 'package:kursus_online_mobile/constants/helpers/device_helpers.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/features/course/data/services/midtrans_service.dart';
import 'package:kursus_online_mobile/features/course/midtrans_web_view.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';

class CoursePurchaseSection extends StatelessWidget {
  const CoursePurchaseSection({super.key, required this.price, this.sectionKey, required this.course});

  final String price;
  final CourseDetailModel course;

  final Key? sectionKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: sectionKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          price,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 6),
        UElevatedButtonZeroRadius(
          width: UDeviceHelper.getScreenWidth(context),
          bgColor: HexColor.fromHex("#9432C5"),
          onPressed: () async{
            final user = await ApiClient.getUser();

    final token = await MidtransService.getSnapToken(user: user, course: course);
    if(token == null) {
      print("Failed Get Token!");
      return;
    } 

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MidtransWebViewPage(snapToken: token, user: user, course: course,))
    );},
          child: Text(
            "Buy now",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ),
        SizedBox(height: 8),
        Column(
          children: [
            UElevatedButtonZeroRadius(
              width: UDeviceHelper.getScreenWidth(context),
              bgColor: Colors.transparent,
              borderColor: Colors.white,
              onPressed: () {},
              child: Text(
                "Remove from cart",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
