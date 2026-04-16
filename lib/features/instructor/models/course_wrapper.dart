import 'package:kursus_online_mobile/features/instructor/models/course_model.dart';
import 'package:kursus_online_mobile/features/instructor/models/instructor_model.dart';

class CourseWrapper {
    final List<InstructorModel> instructor;
  final List<CourseModel> allCourses;

  CourseWrapper({required this.instructor, required this.allCourses});

  factory CourseWrapper.fromJson(Map<String, dynamic> json) {
    return CourseWrapper(
      instructor: (json['instructor'] as List)
    .map((e) => InstructorModel.fromJson(e))
    .toList(),
      allCourses: (json['instructor_courses'] as List)
          .map((e) => CourseModel.fromJson(e))
          .toList(),
    );
  }
}
