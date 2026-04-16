import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/features/course_detail/data/models/user_model.dart';

import '../storage/token_storage.dart';
import 'api_endpoints.dart';

class ApiClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      headers: {"Accept": "application/json"},
    ),
  );

  static void init() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = TokenStorage.getToken();

          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
      ),
    );
  }

 static Future<UserModel> getUser() async {
    try {
      final response = await ApiClient.dio.get("/user");

      if (response.data == null) {
        throw Exception("User data is empty");
      }

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to get user: $e");
    }
  }


  // static Future<Map<String, dynamic>?> getUser() async {
  //   try {
  //     final response = await dio.get('/user');
  //     return response.data;
  //   } catch (e) {
  //     print("Error getUser: $e");
  //     return null;
  //   }
  // }
}
