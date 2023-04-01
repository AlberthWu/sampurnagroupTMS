// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';

// class GPSDeviceEasyGo extends StatelessWidget {
//   GPSDeviceEasyGo({super.key});

//   Completer<GoogleMapController> controllerGPS = Completer();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => (Get.find<DeviceEasyGoController>().isLoading.value)
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
//             markers: Get.find<DeviceEasyGoController>().markers,
//             onMapCreated: (GoogleMapController controller) {
//               controllerGPS.complete(controller);
//               Get.find<DeviceEasyGoController>()
//                   .manager
//                   .setMapId(controller.mapId);
//             },
//             onTap: (argument) {},
//             onCameraMove:
//                 Get.find<DeviceEasyGoController>().manager.onCameraMove,
//             onCameraIdle: Get.find<DeviceEasyGoController>().manager.updateMap,
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
import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';

class GPSDeviceEasyGo extends StatefulWidget {
  const GPSDeviceEasyGo({super.key});

  @override
  State<GPSDeviceEasyGo> createState() => _GPSDeviceEasyGoState();
}

class _GPSDeviceEasyGoState extends State<GPSDeviceEasyGo> {
  Completer<GoogleMapController> _controller = Completer();

  late ClusterManager _manager;

  Set<Marker> markers = Set();

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(-6.3263292, 106.603353), zoom: 9);

  List<NewPosisi> items = Get.find<DeviceEasyGoController>().items;

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<NewPosisi>(items, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      this.markers = markers;
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
        _manager.setMapId(controller.mapId);
      },
      onTap: (argument) {},
      onCameraMove: _manager.onCameraMove,
      onCameraIdle: _manager.updateMap,
      markers: markers,
    );
  }

  Future<Marker> Function(Cluster<NewPosisi>) get _markerBuilder =>
      (cluster) async {
        return Marker(
            markerId: MarkerId(cluster.getId()),
            position: cluster.location,
            icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
                text: cluster.isMultiple ? cluster.count.toString() : null),
            infoWindow: InfoWindow(title: cluster.items.first.nopol));
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
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
