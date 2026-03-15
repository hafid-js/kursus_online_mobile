import 'package:dio/dio.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';

class AuthService {
  final Dio _dio = ApiClient.dio;

  Future<bool> login({
    required String email, required String password
  }) async {
    try {
      final response = await _dio.post('/login', data: {
        'email': email,
        'password': password
      });

      if(response.statusCode == 200) {
        final token = response.data['data']['token'] as String;
        TokenStorage.saveToken(token);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }


  Future<bool> logoutUser() async {
    try {
      final response = await _dio.post('/logout');

      if(response.statusCode == 200) {
        TokenStorage.clearToken();
        return true;
      }
      return false;
    } catch(e) {
      return false;
    }

  }
}