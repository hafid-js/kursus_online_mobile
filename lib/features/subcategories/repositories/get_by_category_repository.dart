import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/features/subcategories/models/get_by_category_wrapper.dart';

class GetByCategoryRepository {
  final Dio dio;

  GetByCategoryRepository(this.dio);


  Future<List<GetByCategoryWrapper>> fetchGetByCategoryCourses() async {
    final response = await dio.get('/courses/categories');
    final data = response.data['data'] as List;
    return data.map((e) => GetByCategoryWrapper.fromJson(e)).toList();
  }
}