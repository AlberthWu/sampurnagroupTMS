import 'package:dio/dio.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_helper.dart';

class DeviceApiTranstrack {
  final String baseUrl = 'https://telematics.transtrack.id/api/get_devices';
  final String path =
      '?lang=en&user_api_hash=\$2y\$10\$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy';

  Future getDeviceTranstrack() async {
    try {
      final response =
          await Dio(BaseOptions(baseUrl: DeviceApiConst.baseUrl)).get(path);
      // print(response);
      return (response != null)
          ? (response.data as List?)
                  ?.map((e) => DeviceModel.fromJSON(e))
                  .toList() ??
              []
          : [];
    } on DioError catch (e) {
      // print('null');
      throw Exception(e.message);
    }
  }

  Future getDeviceBySearch(String keyword) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: DeviceApiConst.baseUrl))
          .get('$path&s=$keyword');
      // print(response);
      return (response != null)
          ? (response.data as List?)
                  ?.map((e) => DeviceModel.fromJSON(e))
                  .toList() ??
              []
          : [];
    } on DioError catch (e) {
      // print('null');
      throw Exception(e.message);
    }
  }
}
