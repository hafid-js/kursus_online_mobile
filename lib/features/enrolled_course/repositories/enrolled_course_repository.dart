import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/course_model.dart';
import 'package:kursus_online_mobile/features/enrolled_course/models/enrolled_course_wrapper.dart';

class EnrolledCourseRepository {
  final Dio dio;

  EnrolledCourseRepository(this.dio);

  Future<List<CourseModel>> fetchCourses(int page) async {
    final response = await dio.get('/courses?page=$page');
    final data = response.data['data']['data'] as List;
    return data.map((e) => CourseModel.fromJson(e)).toList();
  }

  Future<List<CourseDetailModel>> fetchCourseDetail(CourseModel course) async {
    final response = await dio.get('/courses/${course.slug}');
    final data = response.data['data']['data'] as List;
    return data.map((e) => CourseDetailModel.fromJson(e)).toList();
  }

  Future<List<EnrolledCourseWrapper>> fetchEnrolledCourses() async {
    final response = await dio.get('/student/enrolled-courses');
    final data = response.data['data'] as List;
    print(data);
    return data.map((e) => EnrolledCourseWrapper.fromJson(e)).toList();
  }
}
