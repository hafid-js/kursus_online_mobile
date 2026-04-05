import 'package:kursus_online_mobile/features/course_detail/data/models/chapter_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_language_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/level_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/review_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/instructor_model.dart';

class CourseDetailModel {
  final int? id;
  final String title;
  final String thumbnail;
  final int price;
  final String duration;
  final String slug;
  final String description;
  final String seoDescription;
  final String demoVideo;
  final LevelModel? level;
  final CourseLanguageModel? language;
  final InstructorModel? instructor;
  final int studentCount;
  final int courseCount;
  final List<ReviewModel> reviews;
  final List<ChapterModel> chapters;

  CourseDetailModel({
    this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.duration,
    required this.slug,
    required this.seoDescription,
    required this.demoVideo,
    required this.description,
    required this.level,
    required this.language,
    this.instructor,
    required this.studentCount,
    required this.courseCount,
    required this.reviews,
    required this.chapters,
  });

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      price: json['price'] ?? 0,
      duration: json['duration'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      seoDescription: json['seo_description'] ?? '',
      demoVideo: json['demo_video_source'] ?? '',
      level: json['level'] != null ? LevelModel.fromJson(json['level']) : null,
      language: json['language'] != null
          ? CourseLanguageModel.fromJson(json['language'])
          : null,
     studentCount: (json['instructor']?['students'] as List? ?? []).length,
courseCount: (json['instructor']?['courses'] as List? ?? []).length,
      instructor: json['instructor'] != null
          ? InstructorModel.fromJson(json['instructor'])
          : null,
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
    chapters: (json['chapters'] as List<dynamic>? ?? [])
    .map((e) => ChapterModel.fromJson(e))
    .toList(),
    );
  }
}
