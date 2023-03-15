import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/authentication/login_controller.dart';
import 'package:trackingapp/bussiness_logic/model/authentication/login_model.dart';
import 'package:trackingapp/utils/utils.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://telematics.transtrack.id';
    super.onInit();
  }

  final LoginController loginController = Get.find<LoginController>();

  LoginProvider() {
    allowAutoSignedCert = true;
  }

  Future<LoginModel?> loginUser() async {
    final JSON data = {
      "email": loginController.emailTextController.text,
      "password": loginController.passwordTextController.text
    };
    final Response response = await post('/api/login', data,
        headers: {"Content-Type": "multipart/form-data"});
    if (response.statusCode == 200) {
      return LoginModel.fromJSON(response.body);
    }
  }
}
