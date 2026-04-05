import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/review_model.dart';

class CourseDetailResponse {
  final CourseDetailModel course;
  final List<ReviewModel> reviews;
  final double avgInstructorRating;

  CourseDetailResponse({
    required this.course,
    required this.reviews,
    required this.avgInstructorRating,
  });

  factory CourseDetailResponse.fromJson(Map<String, dynamic> json) {
    return CourseDetailResponse(
      course: CourseDetailModel.fromJson(json['course']),
      reviews: (json['reviews'] as List? ?? [])
          .map((e) => ReviewModel.fromJson(e))
          .toList(),

      avgInstructorRating: (json['avg_instructor_rating'] ?? 0).toDouble(),
    );
  }
}
