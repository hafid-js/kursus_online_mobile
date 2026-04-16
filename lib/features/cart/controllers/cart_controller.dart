import 'package:get/get.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';
import 'package:kursus_online_mobile/features/cart/repository/cart_repository.dart';
import 'package:kursus_online_mobile/features/cart/services/cart_service.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepository repository;

  CartController(this.repository);

  var cartItems = <CartModel>[].obs;
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
      cartItems.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeItem(int id) async {
    try {
      isLoading.value = true;

      final token = await TokenStorage.getToken();
      if (token == null) return;

      final success = await repository.removeFromCart(id, token);

      if (success) {
        cartItems.removeWhere((item) => item.id == id);
        Get.snackbar("Success", "Item removed!");
      } else {
        Get.snackbar("Error", "Failed to remove item");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
