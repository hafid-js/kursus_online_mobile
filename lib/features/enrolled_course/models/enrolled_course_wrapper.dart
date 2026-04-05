import 'package:kursus_online_mobile/features/course_detail/data/models/chapter_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/course_model.dart';

class EnrolledCourseWrapper {
  final int enrollmentId;
  final CourseModel course;
  final List<ChapterModel> chapters;

  EnrolledCourseWrapper({required this.enrollmentId, required this.course, required this.chapters});

  factory EnrolledCourseWrapper.fromJson(Map<String, dynamic> json) {
    return EnrolledCourseWrapper(
      enrollmentId: json['id'],
      course: CourseModel.fromJson(json['course']),
      chapters: json['course']['chapters'] != null ? (json['course']['chapters'] as List).map((e) => ChapterModel.fromJson(e)).toList() : []
    );
  }
}
