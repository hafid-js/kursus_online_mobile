import 'package:kursus_online_mobile/features/enrolled_course/data/models/enrolled_course_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/data/models/instructor_model.dart';

class CourseModel {
  final int id;
  final String title;
  final String thumbnail;
  final InstructorModel? instructor;
  final List<EnrollmentModel> enrollments;

  CourseModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.instructor,
    required this.enrollments,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      enrollments: json['enrollments'] != null
          ? (json['enrollments'] as List)
                .map((e) => EnrollmentModel.fromJson(e))
                .toList()
          : [],
          instructor: json['instructor'] != null ? InstructorModel.fromJson(json['instructor']) : null
    );
  }
}
