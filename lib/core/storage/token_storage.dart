import 'package:get_storage/get_storage.dart';

class TokenStorage{
  static final _box = GetStorage();

  static void saveToken(String token) {
    _box.write("token", token);
  }

  static String? getToken() {
    return _box.read("token");
  }

  static void clearToken() {
    _box.remove("token");
  }

}