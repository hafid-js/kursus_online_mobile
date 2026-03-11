import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/common/widgets/images/rounded_image.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/course/course.dart';
import 'package:kursus_online_mobile/features/course_detail/course_detail.dart';

class MyLearningScreen extends StatefulWidget {
  const MyLearningScreen({super.key});

  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 6,
        title: isSearching
            ? Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white70),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSearching = false;
                        searchController.clear();
                      });
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            : Text(
                "My learning",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
        actionsPadding: isSearching
            ? EdgeInsets.zero
            : EdgeInsets.only(right: 12),
        actions: [
          if (!isSearching)
            IconButton(
              onPressed: () {
                setState(() {
                  if (isSearching) {
                    searchController.clear();
                  }
                  isSearching = !isSearching;
                });
              },
              icon: Icon(Icons.search_rounded, color: Colors.white, size: 28),
            ),

          SizedBox(width: 6),
          if (!isSearching)
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext cont) {
                    return CupertinoActionSheet(
                      title: Text("Select filter"),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          child: Text('Favorite courses'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          child: Text('Archived courses'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          child: Text('Downloaded courses'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          child: Text('All courses'),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.of(cont).pop;
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  },
                );
              },

              child: Icon(
                Icons.filter_list_rounded,
                color: Colors.white,
                size: 25,
              ),
            ),
        ],

        centerTitle: true,
        backgroundColor: UColors.backgroundColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: const Color.fromARGB(94, 158, 158, 158),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(() => CourseDetailScreen()),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      URoundedImage(
                        imageUrl: "assets/images/course/course_1.jpg",
                        isNetworkImage: false,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                        borderRadius: 6,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deploy Java Spring Boot 4 Apps Online Amazon Cloud(AWS)",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Programmer Zaman Now',
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 5,
                              width: 300,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(99, 79, 79, 79),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: 0.7,
                                child: Container(color: Colors.purpleAccent),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '46% complete',
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
