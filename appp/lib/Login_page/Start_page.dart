import 'package:appp/Login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Lets get started!',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/image/store1.png',
              color: Colors.white,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
