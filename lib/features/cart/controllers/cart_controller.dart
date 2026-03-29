import 'package:get/get.dart';
import 'package:kursus_online_mobile/features/cart/repository/cart_repository.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepository repository;

  CartController(this.repository);

  var carts = <CartModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCart();
  }

  Future<void> fetchCart() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await repository.getCart();
      carts.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}