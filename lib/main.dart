
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kursus_online_mobile/core/network/api_client.dart';
import 'package:kursus_online_mobile/core/storage/token_storage.dart';
import 'package:kursus_online_mobile/features/auth/screens/login_screen.dart';
import 'package:kursus_online_mobile/features/cart/controllers/cart_controller.dart';
import 'package:kursus_online_mobile/features/cart/repository/cart_repository.dart';
import 'package:kursus_online_mobile/features/cart/services/cart_service.dart';
import 'package:kursus_online_mobile/features/subcategories/subcategories.dart';
import 'package:kursus_online_mobile/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  ApiClient.init();
Get.put(
  CartController(
    CartRepository(CartService()),
  ),
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SubCategoriesScreen()
    );
  }
}

// SplashScreen untuk cek token
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = TokenStorage.getToken();

    // Delay sebentar untuk menunggu GetStorage ready
    Future.microtask(() {
      if (token != null) {
        Get.off(() => const MainScreen());
      } else {
        Get.off(() => const LoginScreen());
      }
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
