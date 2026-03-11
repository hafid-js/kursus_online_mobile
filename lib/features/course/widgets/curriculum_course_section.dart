import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/course/data/curriculum.dart';

class CurriculumCourseSection extends StatefulWidget {
  const CurriculumCourseSection({super.key});

  @override
  State<CurriculumCourseSection> createState() =>
      _CurriculumCourseSectionState();
}

class _CurriculumCourseSectionState extends State<CurriculumCourseSection> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ...curriculums.map((section) {
          bool isExpanded = false;
          return StatefulBuilder(
            builder: (context, setStateTile) {
              return ExpansionTile(
                initiallyExpanded: true,
                tilePadding: EdgeInsets.zero,
                title: Text(
                  section["title"],
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                trailing: Icon(
                  isExpanded ? Icons.remove : Icons.add,
                  color: Colors.white,
                ),
                onExpansionChanged: (expanded) {
                  setStateTile(() {
                    isExpanded = expanded;
                  });
                },
                children: [
                  ...section["items"].map<Widget>((item) {
                    return ListTile(
                      minLeadingWidth: 0,
                      leading: Text(
                        item["number"],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      title: Text(
                        item["title"],
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      subtitle: Text(
                        item["subtitle"],
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      trailing: item["subtitle"].startsWith("Video")
                          ? Icon(
                              Icons.play_circle_outline_rounded,
                              color: Colors.white,
                            )
                          : null,
                    );
                  }).toList(),
                ],
              );
            },
          );
        }),
                SizedBox(height: 15),
        Center(
          child: Text(
            "3 more sections",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: HexColor.fromHex("#9432C5"),
            ),
          ),
        ),
      ],
    );
  }
}