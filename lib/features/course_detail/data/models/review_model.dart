import 'package:kursus_online_mobile/features/course_detail/data/models/user_model.dart';

class ReviewModel {
  final int id;
  final UserModel? user;
  final int courseId;
  final String review;
  final int rating;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReviewModel({
    required this.id,
    required this.user,
    required this.courseId,
    required this.review,
    required this.rating,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      user: json['user'] != null
          ? UserModel.fromJson(json['user'])
          : null,
      courseId: json['course_id'],
      review: json['review'] ?? '',
      rating: json['rating'] ?? 0,
      status: json['status'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}