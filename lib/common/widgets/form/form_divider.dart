import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';

class UFormDivider extends StatelessWidget {
  const UFormDivider({super.key,required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            endIndent: 5,
            thickness: 0.5,
            color: dark ? UColors.darkGrey : Colors.grey,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15,color: Colors.white),
        ),
        Expanded(
          child: Divider(
            indent: 5,
            endIndent: 60,
            thickness: 0.5,
            color: dark ? UColors.darkGrey : Colors.grey,
          ),
        ),
      ],
    );
  }
}