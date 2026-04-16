import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/bars/rating_bar.dart';
import 'package:kursus_online_mobile/common/widgets/buttons/elevated_button_zero_radius.dart';
import 'package:kursus_online_mobile/common/widgets/cards/review_card.dart';
import 'package:kursus_online_mobile/common/widgets/texts/course_creator.dart';
import 'package:kursus_online_mobile/common/widgets/texts/course_header.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/common/widgets/texts/description.dart';
import 'package:kursus_online_mobile/common/widgets/videos/course_information.dart';
import 'package:kursus_online_mobile/common/widgets/videos/course_preview.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/course/widgets/course_purchase_section.dart';
import 'package:kursus_online_mobile/features/course/widgets/curriculum_course_section.dart';
import 'package:kursus_online_mobile/features/course/widgets/instructor_section.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_response_wrapper.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.courseDetail, required this.cartId});
  final CourseDetailResponse courseDetail;
  final int cartId;

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
                      thumbnail: widget.courseDetail.course.thumbnail,
                      videoUrl:
                          widget.courseDetail.course.demoVideo,
                    ),
                    SizedBox(height: 16),
                    UCourseHeader(
                      title: widget.courseDetail.course.title,
                      description: widget.courseDetail.course.seoDescription,
                      rating: 4.6,
                      ratingCount: 442,
                      students: 5000,
                    ),

                    SizedBox(height: 20),
                    UCourseCreator(
                      creators: [widget.courseDetail.course.instructor!.name],
                    ),
                    SizedBox(height: 12),
                    UCourseInformation(
                      duration: widget.courseDetail.course.duration,
                      level: widget.courseDetail.course.level!.name,
                      studentEnrolled: widget.courseDetail.course.studentCount
                          .toString(),
                      language: widget.courseDetail.course.language!.name,
                    ),
                    SizedBox(height: 20),
                    CoursePurchaseSection(
                      cartId: widget.cartId,
                      course: widget.courseDetail.course,
                      price: UHelperFunctions.formatRupiah(
                        widget.courseDetail.course.price,
                      ),
                      sectionKey: requirementsKey,
                    ),
                    SizedBox(height: 20),

                    CurriculumCourseSection(chapters: widget.courseDetail.course.chapters),
                    SizedBox(height: 20),

                    // RequirementsSection(requirements: requirement),
                    // SizedBox(height: 20),

                    UDescription(
                      description:
                          widget.courseDetail.course.description
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

                    // Column(
                    //   children: courses.map((course) {
                    //     return UCourseCard(course: course);
                    //   }).toList(),
                    // ),
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

                    InstructorSection(
                      instructor: widget.courseDetail.course.instructor,
                      rating: widget.courseDetail.avgInstructorRating,
                      studentCount: widget.courseDetail.course.studentCount.toString(),
                      courseCount: widget.courseDetail.course.courseCount.toString()
                    ),

                    SizedBox(height: 4),
                    UDescription(
                      description:
                          widget.courseDetail.course.instructor!.bio,
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.courseDetail.course.reviews.length,
                      itemBuilder: (context, index) {
                        final review =
                            widget.courseDetail.course.reviews[index];

                        return UReviewCard(user: review.user, review: review);
                      },
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
