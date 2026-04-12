import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/features/subcategories/models/get_by_category_wrapper.dart';
import 'package:kursus_online_mobile/features/subcategories/repositories/get_by_category_repository.dart';

class GetByCategoryService {
  final GetByCategoryRepository _repository;

  GetByCategoryService(Dio dio) : _repository = GetByCategoryRepository(dio);

  Future<List<GetByCategoryWrapper>> getByCategoryCourses() async {
    return await _repository.fetchGetByCategoryCourses();
  }
}