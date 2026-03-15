import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/features/enrolled_course/data/models/enrolled_course_wrapper.dart';
import 'package:kursus_online_mobile/features/enrolled_course/data/repositories/enrolled_course_repository.dart';

class EnrolledCourseService {
  final EnrolledCourseRepository _repository;

  EnrolledCourseService(Dio dio) : _repository = EnrolledCourseRepository(dio);

  Future<List<EnrolledCourseWrapper>> getEnrolledCourses() async {
    return await _repository.fetchEnrolledCourses();
  }
}
