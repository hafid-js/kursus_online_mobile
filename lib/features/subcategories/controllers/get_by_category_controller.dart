import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';
import 'package:kursus_online_mobile/features/subcategories/models/get_by_category_wrapper.dart';


class GetByCategoryController extends GetxController {
  var isLoading = true.obs;
  var getByCategory = Rxn<GetByCategoryWrapper>();

  final Dio dio = ApiClient.dio;

  @override
  void onInit() {
    super.onInit();
    _checkLoginAndFetch();
  }

  Future<void> _checkLoginAndFetch() async {
    final token = await TokenStorage.getToken();
    if (token != null) {
      await fetchCategoryCourses(token);
    } else {
      isLoading.value = false;
    }
  }

  Future<void> fetchCategoryCourses(String token) async {
  try {
    isLoading.value = true;

    final response = await dio.get(
      ApiEndpoints.getByCategory,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data;

    if (data is Map<String, dynamic>) {
      getByCategory.value = GetByCategoryWrapper.fromJson(data);
    } else {
      print("Invalid response format");
    }

  } catch (e) {
    print("Error fetching category courses : $e");
  } finally {
    isLoading.value = false;
  }
}
}