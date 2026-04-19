

import 'package:kursus_online_mobile/features/home/models/categories_model.dart';
import 'package:kursus_online_mobile/features/home/models/course_model.dart';

class FeaturedCoursesWrapper {
  final List<CategoriesModel> categories;
  final List<CourseModel> allCourses;

  FeaturedCoursesWrapper({
    required this.categories,
    required this.allCourses
  });

  factory FeaturedCoursesWrapper.fromJson(Map<String, dynamic> json) {
  return FeaturedCoursesWrapper(

    categories: (json['categories'] as List)
        .map((e) => CategoriesModel.fromJson(e))
        .toList(),


    allCourses: (json['all_courses'] as List)
        .map((e) => CourseModel.fromJson(e))
        .toList(),
  );
}
}