import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/button/elevated_button_zero_radius.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_video.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isExpanded = false;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
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
                          leading: Text("1", style: TextStyle(fontSize: 16, color: Colors.white),),
                          title: Text(
                            "Introduction",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          subtitle: Text("Video - 3.58", style: TextStyle(color: Colors.white, fontSize: 10),),
                          trailing: Icon(Icons.play_circle_outline_rounded, color: Colors.white,),
                        ),
                        ListTile(
                            leading: Text("2", style: TextStyle(fontSize: 16, color: Colors.white),),
                          title: Text(
                            "Downloads PDFs and Code",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          subtitle: Text("Article", style: TextStyle(color: Colors.white, fontSize: 10),),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
