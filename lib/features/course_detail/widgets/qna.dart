import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/features/course_detail/data/qna.dart';
import 'package:kursus_online_mobile/features/course_detail/widgets/question_answer.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class QnaSection extends StatelessWidget {
  const QnaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UCircularImage(
          image: "assets/images/instructor_8.jpg",
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
                "Why is JQuery still bing used now?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                "Hasn't jQuery technology become oudated? Why are projects still using this technology?",
                style: TextStyle(color: Colors.grey[200], fontSize: 14),
              ),
              SizedBox(height: 4),
              Image.asset(
                "assets/images/course/course_1.jpg",
                width: 180,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 4),
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
              SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  showBarModalBottomSheet(
                    expand: true,
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Text(
                                      "Back",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Question",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 15),

                                      Column(
                                        children: [
                                          QuestionAnswer(
                                            image: question["image"],
                                            title: question["title"],
                                            subtitle: question["subtitle"],
                                            attachment: question["attachment"],
                                          ),

                                          QuestionAnswer(
                                            image: answer["image"],
                                            subtitle: answer["subtitle"],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'No replies',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
