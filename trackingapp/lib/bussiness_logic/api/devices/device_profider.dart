import 'package:get/get.dart';
import 'package:trackingapp/utils/utils.dart';

class DevicesProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://telematics.transtrack.id';
    super.onInit();
  }

  // final String token = "$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy";

  // Future getListDevices() async{
  //   final Response<JSON> response = await get('?lang=en&user_api_hash=$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy');
  // }
}
