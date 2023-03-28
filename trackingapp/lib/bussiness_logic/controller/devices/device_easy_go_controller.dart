import 'package:dio/dio.dart';
import 'package:fluster/fluster.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_easygo_repository.dart';

class DeviceEasyGoController extends GetxController {
  final Rxn<LastPositionModel> listDevice = Rxn<LastPositionModel>();
  final RxList<Data> data = RxList();

  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  var isShow = false.obs;

  var markers = RxSet<Marker>();

  Dio dio = Dio();

  var cluster = Fluster;

  @override
  void onInit() {
    deviceList();
    super.onInit();
  }

  @override
  void onReady() {
    deviceList();
    super.onReady();
  }

  Future deviceList() async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await DeviceEasyGoApi().getDeviceEasyGo();
      print(result);
      isLoading(false);
      isError(false);
      listDevice.value = result;
      for (var i in listDevice.value!.data) {
        data.add(i);
      }
      return listDevice;
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    } finally {
      for (var i in data) {
        if (isShow == true) {
          createMarkers();
        }
      }
    }
  }

  createMarkers() async {
    data.forEach((element) async {
      markers.add(
        Marker(
            markerId: MarkerId(element.nopol ?? ''),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(element.lat, element.lon),
            infoWindow: InfoWindow(
              title: element.nopol,
            )),
      );
    });
  }
}
