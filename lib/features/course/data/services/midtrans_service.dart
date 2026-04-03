import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/course_detail_model.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/user_model.dart';

class MidtransService {
  static Future<String?> getSnapToken({
  required UserModel user,
  required CourseDetailModel course,
}) async {
  final token = await TokenStorage.getToken();

  try {
    final response = await ApiClient.dio.post(
      '/midtrans/create-transaction',
      data: {
        "name": user.name,
        "email": user.email,
        "items": [
          {
            "id": course.id,
            "name": course.title,
            "price": course.price,
            "quantity": 1,
          }
        ],
      },
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    if (response.statusCode == 200) {
      final snapToken = response.data['token'];
      print("Snap Token: $snapToken");
      return snapToken; // ✅ kunci
    } else {
      print("Error: ${response.statusCode} ${response.data}");
      return null;
    }
  } catch (e) {
    print("Request failed: $e");
    return null;
  }
}
}