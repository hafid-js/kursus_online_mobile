import 'package:get/get.dart';
import 'package:kursus_online_mobile/features/search/models/category_model.dart';
import 'package:kursus_online_mobile/features/search/repositories/category_repository.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = true.obs;

  final CategoryRepository repository;

  CategoryController(this.repository);

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      final data = await repository.getCategories();
      categories.assignAll(data);
    } finally {
      isLoading(false);
    }
  }

}