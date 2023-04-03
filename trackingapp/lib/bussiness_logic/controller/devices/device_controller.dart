import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/events/events_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_helper.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_repository.dart';
import 'package:trackingapp/ui/pages/details_page.dart';
import 'dart:ui' as ui;

class DeviceController extends GetxController {
  final RxList<DeviceModel> listDevice = RxList();
  // final _listDevice = Stream<List<DeviceModel>>.value([]).obs;
  // Stream<List<DeviceModel>> get listDevice => _listDevice.value;
  // final DeviceProvider deviceProvider = Get.find();
  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  // final RxList<Items> itemsModel = RxList();
  late List<Items> itemsModel = <Items>[].obs;
  var isShow = false.obs;
  var markers = RxSet<Marker>();
  var markersDetail = RxSet<Marker>();

  // late BitmapDescriptor iconAlias;

  Dio dio = Dio();

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
      final result = await DeviceApiTranstrack().getDeviceTranstrack();
      isLoading(false);
      isError(false);
      listDevice.value = result;
      // _listDevice.value = Stream.fromIterable([result]);
      for (var i in listDevice.value) {
        for (var j in i.items) {
          itemsModel.add(j);
        }
      }
      return listDevice;
      // return itemsModel;
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    } finally {
      createMarkers();
    }
  }

  createMarkers() async {
    // final BitmapDescriptor markIcons = BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(), "assets/truck1.png");
    // final Uint8List iconAlias =
    //     await getBytesFromAsset('assets/truck1.png', 500);
    final ByteData data = await rootBundle.load('assets/truck1.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: 200);
    ui.FrameInfo fi = await codec.getNextFrame();
    final Uint8List iconAlias =
        (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
            .buffer
            .asUint8List();
    itemsModel.forEach(
      (element) async {
        markers.add(Marker(
          markerId: MarkerId(element.id.toString()),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(element.lat, element.lng),
          infoWindow: InfoWindow(
            title: element.name,
            snippet: element.name,
            onTap: () {
              final detailData = element;
              final deviceId =
                  Get.find<EventsController>().eventsList(element.id);
              Get.to(DeviceDetail(detailData, deviceId));
            },
          ),
        ));
      },
    );
  }
}
