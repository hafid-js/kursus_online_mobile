import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/constants/helpers/helper_functions.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/features/search/models/category_model.dart';

class CategoryService {
  final Dio dio;

  CategoryService(this.dio);

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await dio.get(ApiEndpoints.categories);

    final data = response.data;

    if (data is! Map<String, dynamic>) {
      throw Exception("Invalid response format");
    }

    final categories = data['categories'];

    if (categories is! List) {
      return [];
    }

    return categories
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}