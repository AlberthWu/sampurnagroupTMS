import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/profile/login_controller.dart';
import 'package:trackingapp/ui/pages/login_page.dart';
import 'package:trackingapp/ui/pages/profile_component.dart';
import 'package:trackingapp/ui/pages/profile_page.dart';

class AuthenticationCheck extends StatelessWidget {
  const AuthenticationCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Get.find<LoginController>().isLoggedIn.value)
        ? LoginPage()
        : ProfileComponent());
  }
}
