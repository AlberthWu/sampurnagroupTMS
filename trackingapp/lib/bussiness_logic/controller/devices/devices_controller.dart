import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_easygo_repository.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_helper.dart';
import 'package:trackingapp/bussiness_logic/services/device/device_repository.dart';
import 'package:trackingapp/ui/pages/details_page_easy_go.dart';

class DevicesController extends GetxController {
  final Rxn<LastPositionModel> listDeviceEasyGo = Rxn<LastPositionModel>();
  final RxList<Data> dataEasyGo = RxList();
  final RxList<Data> newDataEasyGo = RxList();
  final RxList<DeviceModel> listDeviceTranstrack = RxList();
  late List<Items> itemsModel = <Items>[].obs;

  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  var isShow = false.obs;

  final keywordController = TextEditingController();

  late RxSet<Marker> markers = RxSet<Marker>();
  late ClusterManager clusterManager;
  Completer<GoogleMapController> controllerGPS = Completer();
  late ClusterManager manager;
  // Set<Marker> markers = Set();

  RxList<NewPosisi> items = RxList();
  RxList<NewPosisi> items2 = RxList();

  Dio dio = Dio();

  @override
  void onInit() {
    deviceListEasyGo();
    deviceListTranstrack();
    // manager = initClusterManager();
    super.onInit();
  }

  @override
  void onReady() {
    // onInit()
    // for (var i in data) if (i.selected == true) createMarkers();
    super.onReady();
  }

  Future deviceListEasyGo() async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await DeviceEasyGoApi().getDeviceEasyGo();
      // print(result);
      isLoading(false);
      isError(false);
      listDeviceEasyGo.value = result;
      for (var i in listDeviceEasyGo.value!.data) {
        dataEasyGo.add(i);
        items.add(NewPosisi(i.nopol, LatLng(i.lat, i.lon)));
        // return data;
      }
      return listDeviceEasyGo;
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    } finally {
      // createMarkers();
      // cameraSelected();
      // initClusterManager();
      // updateMarkers(markers);
      // markerBuilder;
    }
  }

  Future deviceListTranstrack() async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await DeviceApiTranstrack().getDeviceTranstrack();
      isLoading(false);
      isError(false);
      listDeviceTranstrack.value = result;
      for (var i in listDeviceTranstrack.value) {
        for (var j in i.items) {
          itemsModel.add(j);
          items2.add(NewPosisi(j.name, LatLng(j.lat, j.lng)));
        }
      }
      // print(items2);
      return listDeviceTranstrack;
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
  }

  // ClusterManager initClusterManager() {
  //   return ClusterManager<NewPosisi>(items, updateMarkers,
  //       markerBuilder: markerBuilder);
  // }

  // void updateMarkers(Set<Marker> markers) {
  //   markers = markers;
  // }

  // Future<Marker> Function(Cluster<NewPosisi>) get markerBuilder =>
  //     (cluster) async {
  //       return Marker(
  //           markerId: MarkerId(cluster.getId()),
  //           position: cluster.location,
  //           icon: await getMarkerBitmap(cluster.isMultiple ? 125 : 75,
  //               text: cluster.isMultiple ? cluster.count.toString() : null),
  //           infoWindow: InfoWindow(title: cluster.items.first.nopol));
  //     };

  // Future<BitmapDescriptor> getMarkerBitmap(int size, {String? text}) async {
  //   if (kIsWeb) size = (size / 2).floor();
  //   final PictureRecorder pictureRecorder = PictureRecorder();
  //   final Canvas canvas = Canvas(pictureRecorder);
  //   final Paint paint1 = Paint()..color = Colors.orange;
  //   final Paint paint2 = Paint()..color = Colors.white;

  //   canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
  //   canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
  //   canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

  //   if (text != null) {
  //     TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
  //     painter.text = TextSpan(
  //         text: text,
  //         style: TextStyle(
  //             fontSize: size / 3,
  //             color: Colors.white,
  //             fontWeight: FontWeight.normal));
  //     painter.layout();
  //     painter.paint(canvas,
  //         Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2));
  //   }
  //   final img = await pictureRecorder.endRecording().toImage(size, size);
  //   final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;
  //   return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  // }

  // void cameraSelected() {
  //   data.forEach(
  //     (element) {
  //       final position =
  //           CameraPosition(target: LatLng(element.lat, element.lon), zoom: 12);
  //       // return position;
  //     },
  //   );
  // }

  // // Future createMarkers() async {
  // //   data.forEach((element) async {
  // //     // if (element.selected.value == true)
  // //     markers.add(
  // //       Marker(
  // //         markerId: MarkerId(element.nopol),
  // //         icon: BitmapDescriptor.defaultMarker,
  // //         position: LatLng(element.lat, element.lon),
  // //         infoWindow: InfoWindow(
  // //           title: element.nopol,
  // //           onTap: () {
  // //             final data = element;
  // //             Get.to(DeviceDetailsEasyGo(data));
  // //           },
  // //         ),
  // //       ),
  // //     );
  // //   });
  // //   return markers;
  // // }

  // deleteMarkers() {
  //   data.forEach((element) async {
  //     var marker = Marker(
  //         markerId: MarkerId(element.nopol),
  //         icon: BitmapDescriptor.defaultMarker,
  //         position: LatLng(element.lat, element.lon),
  //         infoWindow: InfoWindow(
  //           title: element.nopol,
  //         ));
  //     if (element.selected == true) {
  //       // markers.remove(marker);
  //     }
  //   });
  // }

  Future deviceListEasyGoBySearch(List<String> keyword) async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await DeviceEasyGoApi().getDeviceBySearch(keyword);
      print(result);
      isLoading(false);
      isError(false);
      listDeviceEasyGo.value = result;
      for (var i in listDeviceEasyGo.value!.data) {
        dataEasyGo.add(i);
        items.add(NewPosisi(i.nopol, LatLng(i.lat, i.lon)));
        // return data;
      }
      return listDeviceEasyGo;
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
  }

  Future deviceListTranstrackbySearch(String keyword) async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await DeviceApiTranstrack().getDeviceBySearch(keyword);
      isLoading(false);
      isError(false);
      listDeviceTranstrack.value = result;
      for (var i in listDeviceTranstrack.value) {
        for (var j in i.items) {
          itemsModel.add(j);
          items2.add(NewPosisi(j.name, LatLng(j.lat, j.lng)));
        }
      }
      // print(items2);
      return listDeviceTranstrack;
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
  }
}

class NewPosisi with ClusterItem {
  final String nopol;
  final LatLng posisi;

  NewPosisi(this.nopol, this.posisi);

  @override
  String toString() {
    return nopol;
  }

  @override
  LatLng get location => posisi;
}
