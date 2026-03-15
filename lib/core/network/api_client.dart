import 'package:dio/dio.dart';

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
          print("Token used: $token"); // DEBUG

          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
            print("Request headers: ${options.headers}"); // DEBUG
          }

          return handler.next(options);
        },
      ),
    );
  }
}
