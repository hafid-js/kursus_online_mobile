import 'package:kursus_online_mobile/features/course_detail/data/models/lessons_model.dart';

class ChapterModel {
  final int? id;
  final String title;
  final List<LessonsModel> lessons;

  ChapterModel({this.id, required this.title, required this.lessons});

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      title: json['title'] ?? '',
      lessons: (json['lessons'] as List<dynamic>? ?? [])
          .map((e) => LessonsModel.fromJson(e))
          .toList(),
    );
  }
}
