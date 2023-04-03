import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';

class DeviceEasyGoApi {
  final String url = 'https://vtsapi.easygo-gps.co.id/api';
  var dio = Dio();
  var token = '1023K!@*ck)129A';
  Future getDeviceEasyGo() async {
    try {
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Token"] = token;
      final response = await dio.post('$url/report/lastposition',
          data: {"list_nopol": null, "status_vechile": null, "geo_code": null});
      // print(response);
      return LastPositionModel.fromJSON(response.data);
    } catch (e) {}
  }

  Future getDeviceBySearch(List<String> keyword) async {
    try {
      dio.options.headers["Content-Type"] = "application/json";
      dio.options.headers["Token"] = token;
      final response = await dio.post('$url/report/lastposition', data: {
        "list_nopol": keyword,
        "status_vechile": null,
        "geo_code": null
      });
      return LastPositionModel.fromJSON(response.data);
    } catch (e) {}
  }
}
