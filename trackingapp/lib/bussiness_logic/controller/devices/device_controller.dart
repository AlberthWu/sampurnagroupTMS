import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_helper.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_repository.dart';

class DeviceController extends GetxController {
  final RxList<DeviceModel> listDevice = RxList();
  // final DeviceProvider deviceProvider = Get.find();
  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  var updating = false.obs;

  Dio dio = Dio();

  @override
  void onInit() {
    // ever(updating, (_) => deviceList);
    // ever((updating.value == true), (_) => deviceList());
    deviceList();
    // Timer.periodic(Duration(seconds: 3), (_) => deviceList());
    super.onInit();
  }

  // Future deviceList() async {
  //   if (isLoading.value) {
  //     try {
  //       isLoading(true);
  //       final data = await deviceProvider.getListDevice();
  //       if (data != null) {
  //         listDevice.value = data;
  //       }
  //     } finally {
  //       isLoading(false);
  //     }
  //   }
  // }

  Future deviceList() async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await DeviceApi().getData(DeviceApiConst.path);
      isLoading(false);
      isError(false);
      updating(true);
      listDevice.value = result;
      // print(listDevice.value);
      return listDevice;
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
  }

  // Future deviceList() async {
  //   isDataLoading(true);
  //   final data = await deviceProvider.getListDevice();
  //   print(data);
  //   isDataLoading(false);
  //   return data;
  // }
}
