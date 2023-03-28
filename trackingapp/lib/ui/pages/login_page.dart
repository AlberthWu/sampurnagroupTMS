// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:trackingapp/bussiness_logic/controller/profile/login_controller.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Form(
//             child: Padding(
//           padding: const EdgeInsets.all(40.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 onChanged: (value) =>
//                     Get.find<LoginController>().email.value = value,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextFormField(
//                 onChanged: (value) =>
//                     Get.find<LoginController>().password.value = value,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//               ElevatedButton(
//                   onPressed: Get.find<LoginController>().login,
//                   child: Text('Login')),
//               if (Get.find<LoginController>().isLoggedIn.value)
//                 ElevatedButton(
//                     onPressed: Get.find<LoginController>().refresh,
//                     child: Text('refresh')),
//             ],
//           ),
//         )));
//   }
// }

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
                  child: Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    print(Get.find<LoginController>().box.getValues());
                  },
                  child: Text('Cek Box')),
              Text(Get.find<LoginController>().box.getValues().toString())
            ],
          )),
        ),
      ),
    );
  }
}
