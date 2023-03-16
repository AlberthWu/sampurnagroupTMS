import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/api/devices/user_api_hash.dart';
import 'package:trackingapp/bussiness_logic/model/device_model.dart';

class DeviceProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://telematics.transtrack.id/api';
    super.onInit();
  }

  Future getListDevice() async {
    final Response response =
        await get('/get_devices?lang=en&user_api_hash=$newApi');
    print(response.body);
    if (response.body == null) {
      return [];
    } else {
      return response.isOk
          ? (response.body as List?)
                  ?.map((e) => DeviceModel.fromJSON(e))
                  .toList() ??
              []
          : [];
    }
  }

  // Future getListDevice() async {
  //   final Response<List<dynamic>> response =
  //       await get('/get_devices?lang=en&user_api_hash=${newApi}');
  //   if (response.body == null) {
  //     print(response.body);
  //     // print('not found');
  //     return [];
  //   } else {
  //     // print('response');
  //     print(response.body);
  //     return response.isOk
  //         ? (response.body)?.map((e) => DeviceModel.fromJSON(e)).toList() ?? []
  //         : [];
  //   }
  // }
}


// class DeviceProvider {
//   final Dio _dio = Dio();
//   final String _url =
//       'https://telematics.transtrack.id/api/get_devices?lang=en&user_api_hash=${newApi}';

//   Future<DeviceModel> getListDevice() async {
//     try {
//       Response response = await _dio.get(_url);
//       return response.isOk
//           ? (response.body as List?)
//                   ?.map((e) => DeviceModel.fromJSON(e))
//                   .toList() ??
//               []
//           : [];
//     } catch (error, stracktrace) {
//       print('$error $stracktrace');
//       return DeviceModel.withError('Data not found');
//     }
//   }
// }