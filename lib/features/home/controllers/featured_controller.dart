import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';
import 'package:kursus_online_mobile/features/home/models/featured_courses_wrapper.dart';
import 'package:kursus_online_mobile/features/subcategories/models/get_by_category_wrapper.dart';

class FeaturedController extends GetxController {
  final Dio dio = ApiClient.dio;

  var isLoading = true.obs;
  var errorMessage = RxnString();
  var getByCategory = Rxn<FeaturedCoursesWrapper>();

  late final int parentId;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    final token = await TokenStorage.getToken();

    if (token == null) {
      isLoading.value = false;
      errorMessage.value = "Unauthorized";
      return;
    }

    await fetchCategoryCourses(token);
  }

  Future<void> fetchCategoryCourses(String token) async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await dio.get(
        ApiEndpoints.featuredCourses,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data;

      if (data is Map<String, dynamic>) {
        getByCategory.value = FeaturedCoursesWrapper.fromJson(data);
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