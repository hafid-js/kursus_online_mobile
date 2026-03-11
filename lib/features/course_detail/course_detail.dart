import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/colors.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: UColors.backgroundColor,
        appBar: AppBar(backgroundColor: UColors.backgroundColor),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 200, color: Colors.pink),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pemrograman Java : Pemula Sampai Mahir",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Programmer Zaman Now",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0),
                    ),
                  ),
                ),
                Row(
                  children: [
                    TabBar(
                      indicatorAnimation: TabIndicatorAnimation.linear,
                      indicatorPadding: EdgeInsets.zero,
                      labelColor: Colors.white,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.tab,
                      unselectedLabelColor: Colors.grey,
                      dividerHeight: 0,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.purpleAccent,
                            width: 3,
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            "Lectures",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Downloads",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "More",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 76),

                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.grey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) => Container(
                            height: 200,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Download Options",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16),
                                ListTile(
                                  leading: Icon(
                                    Icons.video_collection,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Download Course",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.article,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    "Cancel Downloads",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.download_for_offline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(1, (index) {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 16,
                                left: 16,
                                top: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Section  - Java Dasar",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.download_for_offline_rounded,
                                    color: Colors.purpleAccent,
                                  ),
                                ],
                              ),
                            ),

                            ListTile(
                              contentPadding: EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              minTileHeight: 0,
                              horizontalTitleGap: 1,
                              leading: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.purpleAccent,
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Pendahuluan",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Video - 02:27 mins - Resources (2)",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.download_for_offline_rounded,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              minTileHeight: 0,
                              horizontalTitleGap: 1,
                              leading: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.purpleAccent,
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Discord Group",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Article",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.download_for_offline_rounded,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              minTileHeight: 0,
                              horizontalTitleGap: 1,
                              leading: Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.purpleAccent,
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Pengenalan Java",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Video - 11:04 mins",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.download_for_offline_rounded,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              minTileHeight: 0,
                              horizontalTitleGap: 1,
                              leading: Text(
                                "4",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.purpleAccent,
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Tipe Data Number",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Video - 15:03 mins",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.download_for_offline_rounded,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "No Downloads Yet",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Your downloaded lectures go here",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.keyboard_control_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(width: 16),
                            Text(
                              "About this course",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Icon(
                              Icons.keyboard_control_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(width: 16),
                            Text(
                              "Course certificate",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
