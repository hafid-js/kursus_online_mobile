import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';

class QuestionAnswer extends StatelessWidget {
  const QuestionAnswer({super.key, required this.image, this.title, required this.subtitle, this.attachment});


  final String image;
  final String? title;
  final String subtitle;
  final String? attachment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UCircularImage(
              image: image,
              isNetworkImage: false,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                 if (attachment != null)
  Image.asset(
    attachment!,
    width: 250,
    height: 150,
    fit: BoxFit.cover,
  ),
                  SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      children: [
                        TextSpan(
                          text: "Aul ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "7 days ago Lecture 606"),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
