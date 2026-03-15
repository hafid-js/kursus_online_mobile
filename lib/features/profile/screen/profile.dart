import 'package:flutter/material.dart';
import 'package:kursus_online_mobile/common/widgets/images/circular_image.dart';
import 'package:kursus_online_mobile/constants/colors.dart';
import 'package:kursus_online_mobile/features/auth/controller/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = AuthController();
    return Scaffold(
      backgroundColor: UColors.backgroundColor,
      appBar: AppBar(backgroundColor: UColors.backgroundColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              UCircularImage(
                image: "assets/images/instructor_8.jpg",
                height: 100,
                width: 100,
              ),
              SizedBox(height: 20),
              Text(
                "Hafid",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "afidzpratama@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  _authController.logout(context);
                },
                child: Text(
                  "Sign out",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
