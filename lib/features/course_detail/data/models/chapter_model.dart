import 'package:kursus_online_mobile/features/enrolled_course/models/course_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/instructor_model.dart';

class ChapterModel {
  final int? id;
  final String title;


  ChapterModel({
    this.id,
    required this.title,
  });


  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(title: json['title']);
  }

}