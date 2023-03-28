import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/profile/login_controller.dart';
import 'package:trackingapp/utils/style.dart';

class ProfileComponent extends StatelessWidget {
  ProfileComponent({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            const Padding(
              padding: const EdgeInsets.all(70.0),
              child: Center(
                child: Text('Cookie'),
              ),
            ),
            if (Get.find<LoginController>().isLoggedIn.value)
              Column(
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
                        await Get.find<LoginController>().login(
                            emailController.text, passwordController.text);
                      },
                      child: Text('Login')),
                  ElevatedButton(
                      onPressed: Get.find<LoginController>().refreshSession,
                      child: Text('refresh')),
                  ElevatedButton(
                      onPressed: Get.find<LoginController>().logout,
                      child: Text('logout'))
                ],
              ),
            ElevatedButton(
                onPressed: () {
                  print(Get.find<LoginController>().box.getValues());
                },
                child: Text('Cek Box')),
            Text(Get.find<LoginController>().box.getValues().toString())
          ],
        ));
  }
}
