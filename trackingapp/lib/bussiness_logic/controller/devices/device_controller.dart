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
      listDevice.value = result;
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

  // deviceList() async {
  //   try {
  //     isLoading(true);
  //     final result = await DeviceApi().getData(DeviceApiConst.path);
  //     isLoading(false);
  //     isError(false);
  //     updating(true);
  //     listDevice.value = result;
  //     // print(listDevice.value);
  //     return listDevice;
  //   } catch (e) {
  //     isLoading(false);
  //     isError(true);
  //     throw Exception(e);
  //   } finally {
  //     isLoading(false);
  //     print('finally : $listDevice');
  //     // createMarkers();
  //   }
  // }

  // createMarkers() {
  //   listDevice.forEach((element) {
  //     marker.add(Marker(markerId: MarkerId(element.items[0].id.toString())));
  //     icon:
  //     BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  //     position:
  //     LatLng(element.items[0].lat, element.items[0].lng);
  //     infoWindow:
  //     InfoWindow(
  //         title: element.items[0].name, snippet: element.items[0].address);
  //     onTap:
  //     () {
  //       print('market tapped');
  //     };
  //   });
  // }

  // Future deviceList() async {
  //   isDataLoading(true);
  //   final data = await deviceProvider.getListDevice();
  //   print(data);
  //   isDataLoading(false);
  //   return data;
  // }

  // listItem() async {
  //   try {
  //     // final DeviceController deviceController = Get.find();
  //     // print('kepanggil');
  //     isShow(true);
  //     // print('${isShow} maknfaklnfakj');
  //     isLoading(true);
  //     final result = await DeviceApi().getData(DeviceApiConst.path);
  //     isLoading(false);
  //     isError(false);
  //     listDevice.value = result;
  //     if (listDevice.value.isEmpty) {
  //       print('Kosonggggg');
  //     } else {
  //       for (final DeviceModel deviceList
  //           in Get.find<DeviceController>().listDevice.toList()) {
  //         for (final Items items in deviceList.items.toList()) {
  //           print(items.lat);
  //           itemsModel.add(items);
  //         }
  //       }
  //     }

  //     print(itemsModel);
  //     return itemsModel;
  //   } catch (e) {
  //     printError();
  //   } finally {
  //     createMarkers();
  //   }
  // }

  // void setIcon() async {
  //   iconAlias = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(), "assets/truck1.png");
  // }

  // getBytesFromAsset(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetWidth: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   theIcon = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  //   return theIcon;
  // }

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
    // BitmapDescriptor aliasIcon = await BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration(size: Size(150, 150), devicePixelRatio: 15),
    //         'assets/truck1.png')
    //     .then((value) => iconAlias = value);
    itemsModel.forEach(
      (element) async {
        markers.add(Marker(
          markerId: MarkerId(element.id.toString()),
          icon: BitmapDescriptor.fromBytes(iconAlias),
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
