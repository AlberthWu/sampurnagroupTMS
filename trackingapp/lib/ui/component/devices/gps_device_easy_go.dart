// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';

// class GPSDevices extends StatelessWidget {
//   GPSDevices({super.key});

//   Completer<GoogleMapController> controllerGPS = Completer();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => (Get.find<DevicesController>().isLoading.value)
//         ? Center()
//         : GoogleMap(
//             mapType: MapType.normal,
//             gestureRecognizers: Set()
//               ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
//               ..add(Factory<ScaleGestureRecognizer>(
//                   () => ScaleGestureRecognizer()))
//               ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
//               ..add(Factory<VerticalDragGestureRecognizer>(
//                   () => VerticalDragGestureRecognizer()))
//               ..add(Factory<OneSequenceGestureRecognizer>(
//                   () => new EagerGestureRecognizer())),
//             initialCameraPosition: const CameraPosition(
//                 target: LatLng(-6.3263292, 106.603353), zoom: 0),
//             markers: Get.find<DevicesController>().markers,
//             onMapCreated: (GoogleMapController controller) {
//               controllerGPS.complete(controller);
//               Get.find<DevicesController>()
//                   .manager
//                   .setMapId(controller.mapId);
//             },
//             onTap: (argument) {},
//             onCameraMove:
//                 Get.find<DevicesController>().manager.onCameraMove,
//             onCameraIdle: Get.find<DevicesController>().manager.updateMap,
//           ));
//   }
// }

import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';

class GPSDevices extends StatefulWidget {
  const GPSDevices({super.key});

  @override
  State<GPSDevices> createState() => _GPSDevicesState();
}

class _GPSDevicesState extends State<GPSDevices> {
  Completer<GoogleMapController> _controller = Completer();

  late ClusterManager _managerEasyGo;
  late ClusterManager _managerTranstrack;

  Set<Marker> markersEasyGo = Set();
  Set<Marker> markersTranstrack = Set();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(-6.3263292, 106.603353), zoom: 9);

  List<NewPosisi> itemsEasyGo = Get.find<DevicesController>().items;
  List<NewPosisi> itemsTranstrack = Get.find<DevicesController>().items2;

  @override
  void initState() {
    _managerTranstrack = ClusterManager<NewPosisi>(
        itemsTranstrack, _updateMarkersTranstrack,
        markerBuilder: _markerBuilder(Colors.blue),
        stopClusteringZoom: 14,
        levels: [
          1,
          4.25,
          6.75,
          8.25,
          11.5,
          14.5,
          16.0,
          16.5,
          20.0,
          27,
          30,
          36,
          40
        ]);
    _managerEasyGo = ClusterManager<NewPosisi>(
        itemsEasyGo, _updateMarkersEasyGo,
        markerBuilder: _markerBuilder(Colors.red),
        stopClusteringZoom: 14,
        levels: [
          1,
          4.25,
          6.75,
          8.25,
          11.5,
          14.5,
          16.0,
          16.5,
          20.0,
          27,
          30,
          36,
          40
        ]);

    super.initState();
  }

  // ClusterManager _initClusterManagerEasyGo() {
  //   return ClusterManager<NewPosisi>(itemsEasyGo, _updateMarkersEasyGo,
  //       markerBuilder: _markerBuilderEasyGo,
  //       stopClusteringZoom: 14,
  //       levels: [
  //         1,
  //         4.25,
  //         6.75,
  //         8.25,
  //         11.5,
  //         14.5,
  //         16.0,
  //         16.5,
  //         20.0,
  //         27,
  //         30,
  //         36,
  //         40
  //       ]);
  // }

  // ClusterManager _initClusterManagerTranstrack() {
  //   return ClusterManager<NewPosisi>(itemsTranstrack, _updateMarkersTranstrack,
  //       markerBuilder: _markerBuilderTranstrack,
  //       stopClusteringZoom: 14,
  //       levels: [
  //         1,
  //         4.25,
  //         6.75,
  //         8.25,
  //         11.5,
  //         14.5,
  //         16.0,
  //         16.5,
  //         20.0,
  //         27,
  //         30,
  //         36,
  //         40
  //       ]);
  // }

  void _updateMarkersEasyGo(Set<Marker> markers) {
    setState(() {
      this.markersEasyGo = markers;
    });
  }

  void _updateMarkersTranstrack(Set<Marker> markers) {
    setState(() {
      this.markersTranstrack = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      gestureRecognizers: Set()
        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
        ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer()))
        ..add(Factory<OneSequenceGestureRecognizer>(
            () => new EagerGestureRecognizer())),
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        _managerEasyGo.setMapId(controller.mapId);
        _managerTranstrack.setMapId(controller.mapId);
      },
      onTap: (argument) {},
      onCameraMove: (position) {
        _managerEasyGo.onCameraMove(position);
        _managerTranstrack.onCameraMove(position);
      },
      onCameraIdle: () {
        _managerEasyGo.updateMap();
        _managerTranstrack.updateMap();
      },
      markers: markersEasyGo..addAll(markersTranstrack),
    );
  }

  Future<Marker> Function(Cluster<NewPosisi>) _markerBuilder(Color color) =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75, color,
              text: cluster.isMultiple ? cluster.count.toString() : null),
          infoWindow: cluster.isMultiple
              ? InfoWindow()
              : InfoWindow(title: cluster.items.first.nopol),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, Color color,
      {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = color;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
          text: text,
          style: TextStyle(
              fontSize: size / 3,
              color: Colors.white,
              fontWeight: FontWeight.normal));
      painter.layout();
      painter.paint(canvas,
          Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2));
    }
    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;
    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}

class Place with ClusterItem {
  final String nopol;
  final LatLng latLng;

  Place({required this.nopol, required this.latLng});

  @override
  String toString() {
    return nopol;
  }

  @override
  LatLng get location => latLng;
}
