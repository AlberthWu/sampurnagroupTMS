import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/profile/login_controller.dart';
import 'package:trackingapp/ui/pages/login_page.dart';
import 'package:trackingapp/ui/pages/profile_component.dart';
import 'package:trackingapp/utils/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => (Get.find<LoginController>().isLoggedIn.value)
          ? ProfileComponent()
          : LoginPage()),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text(
      //     'Hi',
      //     style: TextStyle(fontSize: 40, color: MyStyle.primaryColor),
      //   ),
      // ),
    );
  }
}
