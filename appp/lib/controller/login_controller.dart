import 'package:appp/Login_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;

  final String correctUsername = 'admin';
  final String correctPassword = '123';

  void validateLogin() {
    if (username.value == correctUsername &&
        password.value == correctPassword) {
      Get.snackbar('Success', 'Logged in successfully!',
          backgroundColor: Colors.white);
      Get.off(() => ScreenHome());
    } else {
      Get.snackbar('Oops', 'Login failed!', backgroundColor: Colors.white);
    }
  }
}
