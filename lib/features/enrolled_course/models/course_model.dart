import 'package:kursus_online_mobile/features/enrolled_course/models/enrolled_course_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/instructor_model.dart';

class CourseModel {
  final int id;
  final String title;
  final String thumbnail;
  final int price;
  final String duration;
  final String description;
  final String slug;
  final InstructorModel? instructor;
  final List<EnrollmentModel> enrollments;
  final String? levelName;

  CourseModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.duration,
    required this.description,
    required this.slug,
    required this.instructor,
    required this.enrollments,
    required this.levelName,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      price: json['price'],
      duration: json['duration'],
      description: json['description'],
      slug: json['slug'],
      enrollments: json['enrollments'] != null
          ? (json['enrollments'] as List)
                .map((e) => EnrollmentModel.fromJson(e))
                .toList()
          : [],
      instructor: json['instructor'] != null
          ? InstructorModel.fromJson(json['instructor'])
          : null,
      levelName: json['level'] != null ? json['level']['name'] : null,
    );
  }
}
