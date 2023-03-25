import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/profile/login_controller.dart';
import 'package:trackingapp/utils/style.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final session = Get.find<LoginController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle.primaryColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: MyStyle.secondaryColor,
                  focusColor: MyStyle.secondaryColor,
                  hoverColor: MyStyle.secondaryColor,
                ),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: MyStyle.secondaryColor,
                  focusColor: MyStyle.secondaryColor,
                  hoverColor: MyStyle.secondaryColor,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await session.login(
                        emailController.text, passwordController.text);
                  },
                  child: Text('Login'))
            ],
          )),
        ),
      ),
    );
  }
}
