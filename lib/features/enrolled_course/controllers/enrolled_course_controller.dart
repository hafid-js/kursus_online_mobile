import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';
import '../models/enrolled_course_wrapper.dart';

class EnrolledCourseController extends GetxController {
  var isLoading = true.obs;
  var enrolledCourses = <EnrolledCourseWrapper>[].obs;

  final Dio dio = ApiClient.dio;

  @override
  void onInit() {
    super.onInit();
    _checkLoginAndFetch();
  }

  Future<void> _checkLoginAndFetch() async {
    final token = await TokenStorage.getToken();
    if (token != null) {
      await fetchEnrolledCourses(token);
    } else {
      isLoading.value = false;
      print("No token found, user needs to login");
    }
  }

  Future<void> fetchEnrolledCourses(String token) async {
    try {
      isLoading.value = true;
      final response = await dio.get(
        ApiEndpoints.enrolledCourses,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data['data'] as List;
      enrolledCourses.value =
          data.map((e) => EnrolledCourseWrapper.fromJson(e)).toList();
    } catch (e) {
      print("Error fetching enrolled courses: $e");
    } finally {
      isLoading.value = false;
    }
  }
}