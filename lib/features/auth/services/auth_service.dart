import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';

class AuthService {
  final Dio _dio = ApiClient.dio;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final token = response.data['data']['token'] as String;
        TokenStorage.saveToken(token);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return false;

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      if (accessToken == null) return false;

      final response = await _dio.post(
        '/oauth/google',
        data: {'access_token': accessToken},
      );
      if (response.statusCode == 200) {
        final token = response.data['data']['token'] as String;
        TokenStorage.saveToken(token);
        return true;
      }
      return false;
    } catch (e) {
      print("Google login error: $e");
      throw e;
    }
  }

  Future<bool> logoutUser() async {
    try {
      final response = await _dio.post('/logout');

      if (response.statusCode == 200) {
        await _googleSignIn.disconnect();
        TokenStorage.clearToken();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
