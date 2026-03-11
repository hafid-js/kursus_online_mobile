import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/bars/rating_bar.dart';
import 'package:kursus_online_mobile/common/widgets/buttons/elevated_button_zero_radius.dart';
import 'package:kursus_online_mobile/common/widgets/cards/course_card.dart';
import 'package:kursus_online_mobile/common/widgets/cards/review_card.dart';
import 'package:kursus_online_mobile/common/widgets/texts/course_creator.dart';
import 'package:kursus_online_mobile/common/widgets/texts/course_header.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/common/widgets/texts/description.dart';
import 'package:kursus_online_mobile/common/widgets/videos/course_information.dart';
import 'package:kursus_online_mobile/common/widgets/videos/course_preview.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/cart/data/cart.dart';
import 'package:kursus_online_mobile/features/course/data/information.dart';
import 'package:kursus_online_mobile/features/course/data/requirement.dart';
import 'package:kursus_online_mobile/features/course/data/review.dart';
import 'package:kursus_online_mobile/features/course/widgets/course_purchase_section.dart';
import 'package:kursus_online_mobile/features/course/widgets/curriculum_course_section.dart';
import 'package:kursus_online_mobile/features/course/widgets/instructor_section.dart';
import 'package:kursus_online_mobile/features/course/widgets/requirement_section.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final ScrollController _scrollController = ScrollController();
  bool showStickyButton = false;
  final GlobalKey requirementsKey = GlobalKey();
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final context = requirementsKey.currentContext;

      if (context != null) {
        final renderObject = context.findRenderObject();
        if (renderObject is RenderBox) {
          final position = renderObject.localToGlobal(Offset.zero);

          if (position.dy <= 0) {
            if (!showStickyButton) {
              setState(() {
                showStickyButton = true;
              });
            }
          } else {
            if (showStickyButton) {
              setState(() {
                showStickyButton = false;
              });
            }
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        actions: [Icon(Icons.ios_share)],
        actionsPadding: EdgeInsets.only(right: 12),
        backgroundColor: UColors.backgroundColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UCoursePreview(
                      thumbnail: "assets/images/course/course_1.jpg",
                      videoUrl:
                          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                    ),
                    SizedBox(height: 16),

                    UCourseHeader(
                      title:
                          "Deploy Java Spring Boot 4 Apps Online to Amazon Cloud (AWS)",
                      description:
                          "Learn how to deploy your Java Spring Boot 4 Apps online to showcase your Spring Boot Skills! (Live Internet Access)",
                      rating: 4.6,
                      ratingCount: 442,
                      students: 5000,
                    ),

                    SizedBox(height: 20),
                    UCourseCreator(
                      creators: ["Chad Darby", "Harinath Kuntamukkala"],
                    ),
                    SizedBox(height: 12),
                    UCourseInformation(information: information),
                    SizedBox(height: 20),
                    CoursePurchaseSection(
                      price: 149000,
                      sectionKey: requirementsKey,
                    ),
                    SizedBox(height: 20),

                    CurriculumCourseSection(),
                    SizedBox(height: 20),

                    RequirementsSection(requirements: requirement),
                    SizedBox(height: 20),

                    UDescription(
                      description:
                          "This course is meticulously designed for individuals passionate about color, fashion, and personal styling, aiming to achieve certification as a Color Coach. You will gain a thorough understanding of how to use the color wheel to create visually harmonious and impactful outfits, enhancing both your personal and professional styling skills. Drawing from Hellen Davis's groundbreaking book, ColorMePowerful this course leverages proven techniques and principles to guide you through the nuances of color application. By the end of the course, you'll be equipped with the knowledge and expertise needed to:",
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Text(
                          "Students also viewed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    Column(
                      children: courses.map((course) {
                        return UCourseCard(course: course);
                      }).toList(),
                    ),
                    Center(
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor.fromHex("#9432C5"),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    USectionHeading(title: "Instructors"),

                    InstructorSection(),

                    SizedBox(height: 4),
                    UDescription(
                      description:
                          "Whether you're aiming to advance your career in styling, personal branding, or image consulting, this certification will provide you with the tools to stand out as a credible and skilled Color Coach. Transform clients' wardrobes, boost their confidence, and enrich your professional journey with this comprehensive course. Gain practical insights and become a sought-after expert in the field of color analysis.",
                    ),
                    SizedBox(height: 12),

                    Center(
                      child: UElevatedButtonZeroRadius(
                        bgColor: Colors.transparent,
                        borderColor: Colors.white,
                        onPressed: () {},
                        child: Text(
                          "View Profile",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),

                    USectionHeading(title: "Student feedback"),

                    Column(
                      children: const [
                        URatingBar(progress: 0.6, stars: 5, percent: "66%"),
                        URatingBar(progress: 0.4, stars: 4, percent: "27%"),
                        URatingBar(progress: 0.3, stars: 3, percent: "6%"),
                        URatingBar(progress: 0.1, stars: 2, percent: "1%"),
                        URatingBar(progress: 0.1, stars: 1, percent: "1%"),
                      ],
                    ),

                    SizedBox(height: 20),
                    UReviewCard(review: review),
                    UReviewCard(review: review),
                    Center(
                      child: Text(
                        "See all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor.fromHex("#9432C5"),
                        ),
                      ),
                    ),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          if (showStickyButton)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                color: UColors.backgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rp.149.000",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        UElevatedButtonZeroRadius(
                          width: 190,
                          bgColor: HexColor.fromHex("#9432C5"),
                          onPressed: () {},
                          child: Text(
                            "Buy now",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
