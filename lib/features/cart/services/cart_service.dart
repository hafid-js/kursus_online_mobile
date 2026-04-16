import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/network/api_endpoints.dart';
import 'package:kursus_online_mobile/features/cart/models/cart_model.dart';

class CartService {
  final Dio dio = ApiClient.dio;

  Future<List<CartModel>> getCart() async {
    try {
      final response = await dio.get(ApiEndpoints.cart);

      final List list = response.data['data']['data'];

      return list.map((e) => CartModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to fetch cart: $e');
    }
  }

  Future<bool> removeFromCart(int id, String token) async {
    try {
      final response = await dio.delete(
        ApiEndpoints.removeFromCart(id),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      return response.data['success'] == true;
    } catch (e) {
      throw Exception('Remove cart failed: $e');
    }
  }
}