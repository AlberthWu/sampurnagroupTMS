import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/api/devices/device_profider.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device.helper.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_repository.dart';

class DeviceController extends GetxController {
  late RxList<DeviceModel> listDevice = RxList();
  final DeviceProvider deviceProvider = Get.find();
  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  final updating = false.obs;

  Dio dio = Dio();

  @override
  void onInit() {
    // ever(updating, (_) => deviceList);
    deviceList();
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
    isLoading(true);
    try {
      final result = await DeviceApi().getData(ApiConst.path);
      isLoading(false);
      isError(false);
      // updating(true);
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
