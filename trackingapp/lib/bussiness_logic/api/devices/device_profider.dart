// import 'package:get/get.dart';
// import 'package:trackingapp/bussiness_logic/api/devices/user_api_hash.dart';
// import 'package:trackingapp/bussiness_logic/model/device_model.dart';

// class DeviceProvider extends GetConnect {
//   @override
//   void onInit() {
//     httpClient.baseUrl = 'https://telematics.transtrack.id/api';
//     super.onInit();
//   }

//   Future getListDevice() async {
//     final Response response =
//         await get('/get_devices?lang=en&user_api_hash=$newApi');
//     print(response.body);
//     if (response.body == null) {
//       return [];
//     } else {
//       return response.isOk
//           ? (response.body as List?)
//                   ?.map((e) => DeviceModel.fromJSON(e))
//                   .toList() ??
//               []
//           : [];
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:trackingapp/bussiness_logic/api/devices/user_api_hash.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';

class DeviceProvider {
  final String url = 'https://telematics.transtrack.id/api/get_devices';
  final String path = '?lang=en&user_api_hash=${newApi}';

  Future getListDevice() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: url)).get(path);
      print(response);
      return (response != null)
          ? (response.data as List?)
                  ?.map((e) => DeviceModel.fromJSON(e))
                  .toList() ??
              []
          : [];
    } catch (error, stracktrace) {
      print('$error $stracktrace');
      return DeviceModel.withError('Data not found');
    }
  }
}
