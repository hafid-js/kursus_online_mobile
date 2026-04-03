import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';

class OrderService {
  static Future<bool> storeAfterPayment({
    required String transactionId,
    required double mainAmount,
    required double paidAmount,
    required String currency,
  }) async {
    final token = await TokenStorage.getToken();
    try {
      final response = await ApiClient.dio.post(
        '/order/store',
        data: {
          "transaction_id": transactionId,
          "main_amount": mainAmount,
          "paid_amount": paidAmount,
          "currency": currency,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"}
        ),
      );
      return response.statusCode == 200;
    } catch (e) {
      print ("Failed to store order : $e");
      return false;
    }
  }
}