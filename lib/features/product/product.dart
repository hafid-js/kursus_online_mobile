import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kursus_online_mobile/common/widgets/button/elevated_button_zero_radius.dart';
import 'package:kursus_online_mobile/common/widgets/cards/product_card.dart';
import 'package:kursus_online_mobile/common/widgets/cards/review_card.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_video.dart';
import 'package:kursus_online_mobile/common/widgets/texts/section_heading.dart';
import 'package:kursus_online_mobile/common/widgets/texts/show_more.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/device_helpers.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/cart/data/cart.dart';
import 'package:kursus_online_mobile/features/product/data/review.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
        final box = context.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero);

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
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> information = [
      {
        "icon": Icons.watch_later_outlined,
        "title": "Course Duration",
        "desc": "5h 45m",
      },
      {
        "icon": Icons.signal_cellular_alt_rounded,
        "title": "Skill Level",
        "desc": "Beginner",
      },
      {
        "icon": Icons.supervisor_account_outlined,
        "title": "Student Enrolled",
        "desc": "7",
      },
      {"icon": Icons.translate_rounded, "title": "language", "desc": "English"},
    ];
    //       final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    //   foregroundColor: Colors.white,
    //   backgroundColor: Colors.purpleAccent,
    //   minimumSize: Size(88, 36),
    //   padding: EdgeInsets.symmetric(horizontal: 16),
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(2)),
    //   ),
    // );
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight: 10,
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
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            URoundedVideo(
                              videoUrl: "assets/images/course/course_1.jpg",
                              isNetworkVideo: false,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Positioned(
                          top: 70,
                          left: 145,

                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),

                        Positioned(
                          top: 175,
                          left: 120,

                          child: Text(
                            "Preview this course",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    Text(
                      "Deploy Java Spring Boot 4 Apps Online to Amazon Cloud (AWS)",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Learn how to deploy your Java Spring Boot 4 Apps online to showcase your Spring Boot Skills! (Live Internet Access)",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "4.6",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star_rounded,
                              size: 18,
                              color: i < 4 ? Colors.yellow[700] : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "(442 ratings) 5k students",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                            children: [
                              TextSpan(
                                text: "Created by ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: "Chad Darby ",
                                style: TextStyle(
                                  color: HexColor.fromHex("#9432C5"),
                                ),
                              ),
                              TextSpan(
                                text: "and ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: "Harinath Kuntamukkala",
                                style: TextStyle(
                                  color: HexColor.fromHex("#9432C5"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: information.map((info) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(info["icon"], color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      info["title"],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text(
                                  info["desc"],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                          ],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Rp.149.000",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Column(
                      children: [
                        UElevatedButtonZeroRadius(
                          width: UDeviceHelper.getScreenWidth(context),
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Curriculum",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "9 Sections • 37 lectures • 5h 45m total length",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        SizedBox(height: 12),
                        ExpansionTile(
                          initiallyExpanded: true,
                          tilePadding: EdgeInsets.zero,
                          title: Text(
                            "Section 1 - Introduction",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          trailing: Icon(
                            isExpanded ? Icons.remove : Icons.add,
                            color: Colors.white,
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              isExpanded = expanded;
                            });
                          },
                          children: [
                            ListTile(
                              minLeadingWidth: 0,
                              leading: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                "Introduction",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                "Video - 3.58",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              trailing: Icon(
                                Icons.play_circle_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              leading: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                "Downloads PDFs and Code",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                "Article",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: Text(
                            "Section 2 - Getting Started with Amazon Web Services",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          trailing: Icon(
                            isExpanded ? Icons.remove : Icons.add,
                            color: Colors.white,
                          ),
                          onExpansionChanged: (expanded) {
                            setState(() {
                              isExpanded = expanded;
                            });
                          },
                          children: [
                            ListTile(
                              leading: Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                "Amazon Web Services Overview",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                "Video - 3.58",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                              trailing: Icon(
                                Icons.play_circle_outline_rounded,
                                color: Colors.white,
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "4",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                "AWS - key Services - Part 1",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                "Video - 5:15",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text(
                                "Custom Domain Name Registration - Cost",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              subtitle: Text(
                                "Article",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Center(
                          child: Text(
                            "3 more sections",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: HexColor.fromHex("#9432C5"),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          key: requirementsKey,
                          children: [
                            Text(
                              "Requirements",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ListTile(
                              minLeadingWidth: 0,
                              leading: Text(
                                "•",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              title: Text(
                                "Basic Java Spring 3 Boot Knowledge is required",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              leading: Text(
                                "•",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              title: Text(
                                "Basic Java Spring 3 Boot Knowledge is required",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ListTile(
                              minLeadingWidth: 0,
                              leading: Text(
                                "•",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              title: Text(
                                "Basic Java Spring 3 Boot Knowledge is required",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        UDescription(
                          description:
                              "This course is meticulously designed for individuals passionate about color, fashion, and personal styling, aiming to achieve certification as a Color Coach. You will gain a thorough understanding of how to use the color wheel to create visually harmonious and impactful outfits, enhancing both your personal and professional styling skills. Drawing from Hellen Davis's groundbreaking book, ColorMePowerful this course leverages proven techniques and principles to guide you through the nuances of color application. By the end of the course, you'll be equipped with the knowledge and expertise needed to:",
                        ),
                        SizedBox(height: 20),

                        Column(
                          children: [
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
                          ],
                        ),

                        Column(
                          children: products.map((product) {
                            return UProductCard(product: product);
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
                      ],
                    ),

                    USectionHeading(title: "Instructors"),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Chad Darby",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Popular Java Spring Instructor - Best Seller",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            UCircularImage(
                              image: "assets/images/instructor_8.jpg",
                            ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "4.6 Instructor rating",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "173.729 Reviews",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "912.688 Students",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "16 Courses",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 4),
                    UDescription(
                      description:
                          "Whether you're aiming to advance your career in styling, personal branding, or image consulting, this certification will provide you with the tools to stand out as a credible and skilled Color Coach. Transform clients' wardrobes, boost their confidence, and enrich your professional journey with this comprehensive course. Gain practical insights and become a sought-after expert in the field of color analysis.",
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: [
                        UElevatedButtonZeroRadius(
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
                      ],
                    ),

                    USectionHeading(title: "Student feedback"),

                    Column(
                      children: [
                        Row(
                      children: [

                    Text("4,6", style: TextStyle( fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                    SizedBox(width: 6),
                    Text("course rating",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 260,
                          color: const Color.fromARGB(99, 79, 79, 79),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.6,
                            child: Container(
                              color: const Color.fromARGB(129, 79, 79, 79),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        Row(
                          children: [
                            Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: i < 5 ? Colors.yellow[700] : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),

                        Text(
                          "66%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 260,
                          color: const Color.fromARGB(99, 79, 79, 79),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.4,
                            child: Container(
                              color: const Color.fromARGB(129, 79, 79, 79),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        Row(
                          children: [
                            Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: i < 4 ? Colors.yellow[700] : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),

                        Text(
                          "27%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 260,
                          color: const Color.fromARGB(99, 79, 79, 79),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.3,
                            child: Container(
                              color: const Color.fromARGB(129, 79, 79, 79),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        Row(
                          children: [
                            Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: i < 3 ? Colors.yellow[700] : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),

                        Text(
                          "6%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 260,
                          color: const Color.fromARGB(99, 79, 79, 79),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.1,
                            child: Container(
                              color: const Color.fromARGB(129, 79, 79, 79),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        Row(
                          children: [
                            Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: i < 2 ? Colors.yellow[700] : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),

                        Text(
                          "1%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 18,
                          width: 260,
                          color: const Color.fromARGB(99, 79, 79, 79),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.1,
                            child: Container(
                              color: const Color.fromARGB(129, 79, 79, 79),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        Row(
                          children: [
                            Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: i < 1 ? Colors.yellow[700] : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),

                        Text(
                          "1%",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                          ],
                        )
                      ],
                    ),
                    

                        
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
