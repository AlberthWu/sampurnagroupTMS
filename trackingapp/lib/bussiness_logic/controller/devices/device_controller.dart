import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/api/devices/device_profider.dart';
import 'package:trackingapp/bussiness_logic/model/device_model.dart';

class DeviceController extends GetxController {
  final RxList<DeviceModel> listDevice = RxList();
  final DeviceProvider deviceProvider = Get.find();
  var isDataLoading = false.obs;

  // late String dropdownObject =

  @override
  void onInit() {
    deviceList();
    super.onInit();
  }

  Future deviceList() async {
    if (isDataLoading.value == false) {
      try {
        isDataLoading(true);
        final data = await deviceProvider.getListDevice();
        if (data.isNotEmpty) {
          listDevice.value = data;
        }
      } finally {
        isDataLoading(false);
      }
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
