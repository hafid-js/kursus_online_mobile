import '../models/cart_model.dart';
import '../services/cart_service.dart';

class CartRepository {
  final CartService _service;

  CartRepository(this._service);

  Future<List<CartModel>> getCart() async {
    return await _service.getCart();
  }
}