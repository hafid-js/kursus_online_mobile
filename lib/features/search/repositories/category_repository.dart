
import 'package:kursus_online_mobile/features/search/models/category_model.dart';
import 'package:kursus_online_mobile/features/search/services/category_service.dart';

class CategoryRepository {
  final CategoryService service;

    CategoryRepository(this.service);


  Future<List<CategoryModel>> getCategories() {
        return service.fetchCategories();
  }
}