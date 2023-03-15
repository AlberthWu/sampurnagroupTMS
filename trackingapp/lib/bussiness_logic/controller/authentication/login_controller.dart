import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/api/authentication/login_provider.dart';
import 'package:trackingapp/bussiness_logic/model/authentication/login_model.dart';

class LoginController extends GetxController {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  late RxnString message = RxnString();

  final isLogged = false.obs;

  Future userTryLogin() async {
    if (emailTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      final LoginModel? result = await Get.find<LoginProvider>().loginUser();
      if (result == null || result.jwt == null) {
        isLogged.value = false;
        return null;
      } else {}
    }
  }
}
