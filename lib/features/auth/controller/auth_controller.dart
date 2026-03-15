import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/features/auth/screens/login_screen.dart';
import 'package:kursus_online_mobile/features/auth/services/auth_service.dart';

class AuthController {
  final AuthService _authService = AuthService();

  Future<void> logout(BuildContext context) async {
    final success = await _authService.logoutUser();

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Logout Success"), duration: Duration(seconds: 2),)
      );

      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Logout Failed!")));
    }
  }
}
