import 'package:kursus_online_mobile/features/enrolled_course/data/models/course_model.dart';

class EnrolledCourseWrapper {
  final int enrollmentId;
  final CourseModel course;

  EnrolledCourseWrapper({required this.enrollmentId, required this.course});

  factory EnrolledCourseWrapper.fromJson(Map<String, dynamic> json) {
    return EnrolledCourseWrapper(
      enrollmentId: json['id'],
      course: CourseModel.fromJson(json['course']),
    );
  }
}
