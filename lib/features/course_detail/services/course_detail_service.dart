import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_response_wrapper.dart';
class CourseDetailService {
Future<CourseDetailResponse> getCourse(String slug) async {
  try {
    final response = await ApiClient.dio.get(
      ApiEndpoints.courseDetail(slug),
    );

    return CourseDetailResponse.fromJson(
      response.data['data'],
    );
  } catch (e) {
    throw Exception('Failed to fetch course: $e');
  }
}
}