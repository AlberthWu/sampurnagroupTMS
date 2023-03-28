import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';

class DeviceEasyGoApi {
  final String url = 'https://vtsapi.easygo-gps.co.id/api';
  Future getDeviceEasyGo() async {
    try {
      var dio = Dio();
      var token = '1023K!@*ck)129A';
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Token"] = token;
      final response = await dio.post('$url/report/lastposition',
          data: {"list_nopol": null, "status_vechile": 0, "geo_code": null});
      print(response);
      return LastPositionModel.fromJSON(response.data);
    } catch (e) {}
  }
}
