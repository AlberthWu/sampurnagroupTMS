import 'package:dio/dio.dart';
import 'package:flutter_google_maps_widget_cluster_markers/flutter_google_maps_widget_cluster_markers.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_easygo_repository.dart';
import 'package:trackingapp/ui/pages/details_page_easy_go.dart';

class DeviceEasyGoController extends GetxController {
  final Rxn<LastPositionModel> listDevice = Rxn<LastPositionModel>();
  final RxList<Data> data = RxList();
  final RxList<Data> newData = RxList();

  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  final RxSet<Marker> markers = RxSet<Marker>();
  GoogleMapWidgetClusterMarkersController clusterMarkersController =
      GoogleMapWidgetClusterMarkersController();

  Dio dio = Dio();

  @override
  void onInit() {
    deviceList();
    super.onInit();
  }

  @override
  void onReady() {
    onInit();
    super.onReady();
  }

  Future deviceList() async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await DeviceEasyGoApi().getDeviceEasyGo();
      // print(result);
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
      createMarkers();
      cameraSelected();
    }
  }

  cameraSelected() {
    data.forEach(
      (element) {
        final position =
            CameraPosition(target: LatLng(element.lat, element.lon), zoom: 12);
        // return position;
      },
    );
  }

  Future createMarkers() async {
    data.forEach((element) async {
      // if (element.selected.value == true)
      markers.add(
        Marker(
          markerId: MarkerId(element.nopol),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(element.lat, element.lon),
          infoWindow: InfoWindow(
            title: element.nopol,
            onTap: () {
              final data = element;
              Get.to(DeviceDetailsEasyGo(data));
            },
          ),
        ),
      );
    });
    return markers;
  }

  deleteMarkers() {
    data.forEach((element) async {
      var marker = Marker(
          markerId: MarkerId(element.nopol),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(element.lat, element.lon),
          infoWindow: InfoWindow(
            title: element.nopol,
          ));
      if (element.selected == true) {
        // markers.remove(marker);
      }
    });
  }
}
