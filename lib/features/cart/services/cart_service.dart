import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/features/cart/models/cart_model.dart';

class CartService {
  Future<List<CartModel>> getCart() async {
  try {
    final response = await ApiClient.dio.get(ApiEndpoints.cart);

    final body = response.data;

    final List list = body['data']['data']; 

    return list.map((e) => CartModel.fromJson(e)).toList();
  } catch (e) {
    throw Exception('Failed to fetch cart: $e');
  }
}
}
