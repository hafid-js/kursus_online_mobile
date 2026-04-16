import '../models/cart_model.dart';
import '../services/cart_service.dart';

class CartRepository {
  final CartService service;

  CartRepository(this.service);

  Future<List<CartModel>> getCart() async {
    return await service.getCart();
  }

  Future<bool> removeFromCart(int id, String token) {
    return service.removeFromCart(id, token);
  }
}