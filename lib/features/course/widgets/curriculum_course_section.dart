import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/constants/helpers/hex_color.dart';
import 'package:kursus_online_mobile/features/course/data/curriculum.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/chapter_model.dart';

class CurriculumCourseSection extends StatefulWidget {
  const CurriculumCourseSection({super.key, required this.chapters});
  final List<ChapterModel> chapters;
  @override
  State<CurriculumCourseSection> createState() =>
      _CurriculumCourseSectionState();
      
}

class _CurriculumCourseSectionState extends State<CurriculumCourseSection> {


  final Map<int, bool> _expandedState = {};
  

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
          "${widget.chapters.length} Sections",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        SizedBox(height: 12),
        ...widget.chapters.asMap().entries.map((entry) {
          int index = entry.key;
          ChapterModel chapter = entry.value;
          bool isExpanded = _expandedState[index] ?? false;

          return ExpansionTile(
                initiallyExpanded: true,
                tilePadding: EdgeInsets.zero,
                title: Text(
                  widget.chapters.first.title,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                trailing: Icon(
                  isExpanded ? Icons.remove : Icons.add,
                  color: Colors.white,
                ),
                onExpansionChanged: (expanded) {
                  setState(() {
                    _expandedState[index] = expanded;
                  });
                },
                children: chapter.lessons.asMap().entries.map((lessonEntry) {
                  int lessonIndex = lessonEntry.key;
                  var lesson = lessonEntry.value;
                 return ListTile(
                      minLeadingWidth: 0,
                      leading: Text(
                        "${lessonIndex + 1}",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      title: Text(
                        lesson.title,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      subtitle: Text(
                        UHelperFunctions.formatDuration(lesson.duration),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
  
                      trailing: lesson.fileType.startsWith("video")
                          ? Icon(
                              Icons.play_circle_outline_rounded,
                              color: Colors.white,
                            )
                          : null,
                    );
                }).toList(),
                
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