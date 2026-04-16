import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';
import 'package:kursus_online_mobile/features/instructor/models/course_wrapper.dart';

class InstructorController extends GetxController {
  final Dio dio = ApiClient.dio;

  var isLoading = true.obs;
  var errorMessage = RxnString();
  var instructorCourses = Rxn<CourseWrapper>();

  late final int instructorId;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    if (args is int) {
      instructorId = args;
      _init();
    } else {
      isLoading.value = false;
      errorMessage.value = "Invalid instructor id";
    }
  }

  Future<void> _init() async {
    final token = await TokenStorage.getToken();

    if (token == null) {
      isLoading.value = false;
      errorMessage.value = "Unauthorized";
      return;
    }

    await fetchInstructorCourses(token);
  }

  Future<void> fetchInstructorCourses(String token) async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await dio.get(
        ApiEndpoints.instructorCourses(instructorId),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data;

      if (data is Map<String, dynamic>) {
        instructorCourses.value = CourseWrapper.fromJson(data);
      } else {
        errorMessage.value = "Invalid response format";
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}