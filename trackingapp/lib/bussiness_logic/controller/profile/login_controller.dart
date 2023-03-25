import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final isLoggedIn = false.obs;

  final box = GetStorage('cookies');

  final dio = Dio();
  //   BaseOptions(
  //       baseUrl: 'https://api.sampurna-group.com/v2/users/',
  //       headers: {'accept': 'application/json'}),
  // );
  // ..interceptors.add(CookieManager(box));

  Future<void> login(String email, String password) async {
    try {
      final response = await dio.post('login', data: {
        'email': email,
        'password': password,
      });

      final headers = response.headers.map;
      final cookie = headers['set-cookie'];
      if (cookie != null) {
        box.write('cookies', cookie.join('; '));
        dio.options.headers['cookie'] = cookie.join('; ');
        // Timer.periodic(Duration(seconds: 10), (timer) {
        //   box.remove('cookies');
        // });
      }
      isLoggedIn.value = true;
      Timer.periodic(Duration(seconds: 11), (timer) {
        print(cookie);
      });
    } catch (e) {}
  }

  Future<void> refreshSession() async {
    try {
      final token = await box.read('cookies');
      if (token != null) {
        dio.options.headers['cookie'] = token;
        await dio.post('/refresh');
        isLoggedIn.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      final token = await box.read('cookies');
      if (token != null) {
        dio.options.headers['cookie'] = token;
        await dio.post('/logout');
        await box.remove('cookies');
      }
      isLoggedIn.value = false;
    } catch (e) {}
  }

  @override
  void onInit() {
    final cookie = box.read('cookies');
    if (cookie != null) {
      dio.options.headers['cookie'] = cookie;
      isLoggedIn.value = true;
    }
    super.onInit();
  }
}
