import 'package:dio/dio.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_helper.dart';

class DeviceApi {
  Future getData(String path) async {
    try {
      final response =
          await Dio(BaseOptions(baseUrl: DeviceApiConst.baseUrl)).get(path);
      print(response);
      return (response != null)
          ? (response.data as List?)
                  ?.map((e) => DeviceModel.fromJSON(e))
                  .toList() ??
              []
          : [];
    } on DioError catch (e) {
      print('null');
      throw Exception(e.message);
    }
  }
}
