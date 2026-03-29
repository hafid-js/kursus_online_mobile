import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/buttons/elevated_button_zero_radius.dart';
import 'package:kursus_online_mobile/constants/helpers/device_helpers.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';

class CoursePurchaseSection extends StatelessWidget {
  const CoursePurchaseSection({super.key, required this.price, this.sectionKey});

  final String price;

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
          onPressed: () {},
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
