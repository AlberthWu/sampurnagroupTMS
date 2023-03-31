// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginController extends GetxController {
//   final _dio = Dio();
//   final _baseUrl = 'https://api.sampurna-group.com/v2/users';

//   final email = ''.obs;
//   final password = ''.obs;
//   final isLoggedIn = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _dio.interceptors.add(
//       InterceptorsWrapper(onRequest: (options, handler) async {
//         final prefs = await SharedPreferences.getInstance();
//         final cookies = prefs.getStringList('cookies') ?? [];
//         options.headers.addAll({'Cookie': cookies});
//         print(cookies);
//         print(email);
//         print(password);
//         return handler.next(options);
//       }, onResponse: (response, handler) async {
//         final prefs = await SharedPreferences.getInstance();
//         final cookies = response.headers['set-cookie'];
//         if (cookies != null) {
//           prefs.setStringList('cookies', cookies);
//         }
//         return handler.next(response);
//       }),
//     );
//   }

//   Future<void> login() async {
//     try {
//       final response = await _dio.post('$_baseUrl/login',
//           data: {'email': email.value, 'password': password.value});
//       if (response.statusCode == 200) {
//         isLoggedIn.value = true;
//       } else {
//         isLoggedIn.value = false;
//       }
//     } catch (e) {
//       isLoggedIn.value = false;
//     }
//   }

//   Future<void> refresh() async {
//     try {
//       final response = await _dio.post('$_baseUrl/refresh');
//       if (response.statusCode == 200) {
//         isLoggedIn.value = true;
//       } else {
//         isLoggedIn.value = false;
//       }
//     } catch (e) {
//       isLoggedIn.value = false;
//     }
//   }

//   Future<void> logout() async {
//     try {
//       final response = await _dio.post('$_baseUrl/logout');
//       if (response.statusCode == 200) {
//         isLoggedIn.value = false;
//         print('success');
//       }
//     } catch (e) {
//       isLoggedIn.value = false;
//     }
//   }
// }

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final isLoggedIn = false.obs;

  final box = GetStorage('cookies');

  final dio = Dio(
    BaseOptions(
        baseUrl: 'https://api.sampurna-group.com/v2/users/',
        headers: {'accept': 'application/json'}),
  );

  // ..interceptors.add(CookieManager(box));

  Future<void> login(String email, String password) async {
    try {
      final response = await dio.post('login', data: {
        'email': email,
        'password': password,
      });
      // print(response);
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
      // print('ini login' + cookie.toString());
    } catch (e) {}
  }

  Future<void> refreshSession() async {
    try {
      final token = await box.read('cookies');

      if (token != null) {
        dio.options.headers['cookie'] = token;
        await dio.post('/refresh');
        isLoggedIn.value = true;
        // final respons = await dio.post('/refresh');
        // print(await dio.post('/refresh'));
        // print('ini refresh' + token);
      }
    } catch (e) {
      // print(e);
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
      // print('ini logout' + token);
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
