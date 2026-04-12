
import 'package:kursus_online_mobile/features/subcategories/models/categoryName_model.dart';
import 'package:kursus_online_mobile/features/subcategories/models/course_model.dart';
import 'package:kursus_online_mobile/features/subcategories/models/popular_instructor_modal.dart';
import 'package:kursus_online_mobile/features/subcategories/models/sub_categories.dart';

class GetByCategoryWrapper {
  final CategoryNameModel categoryName;
  final List<SubCategoriesModel> subCategories;
  final List<PopularInstructorModel> popularInstructor;
  final List<CourseModel> coursesGetStarted;
  final List<CourseModel> allCourses;

  GetByCategoryWrapper({
    required this.categoryName,
    required this.subCategories,
    required this.popularInstructor,
    required this.coursesGetStarted,
    required this.allCourses
  });

  factory GetByCategoryWrapper.fromJson(Map<String, dynamic> json) {
  return GetByCategoryWrapper(
    categoryName: CategoryNameModel.fromJson(json['category_name']),

    subCategories: (json['sub_categories'] as List)
        .map((e) => SubCategoriesModel.fromJson(e))
        .toList(),

    coursesGetStarted: (json['courses_get_started'] as List)
        .map((e) => CourseModel.fromJson(e))
        .toList(),

            popularInstructor: (json['popular_instructors'] as List)
        .map((e) => PopularInstructorModel.fromJson(e))
        .toList(),


    allCourses: (json['all_courses'] as List)
        .map((e) => CourseModel.fromJson(e))
        .toList(),
  );
}
}