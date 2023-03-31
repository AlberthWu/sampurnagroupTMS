import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';

class GPSDeviceEasyGo extends StatelessWidget {
  const GPSDeviceEasyGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Get.find<DeviceEasyGoController>().isLoading.value)
        ? Center()
        : GoogleMap(
            mapType: MapType.normal,
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
              ..add(Factory<ScaleGestureRecognizer>(
                  () => ScaleGestureRecognizer()))
              ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
              ..add(Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer()))
              ..add(Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer())),
            initialCameraPosition: const CameraPosition(
                target: LatLng(-6.3263292, 106.603353), zoom: 8),
            markers: Get.find<DeviceEasyGoController>().markers,
          ));
  }
}

// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';

// class GPSDeviceEasyGo extends StatefulWidget {
//   const GPSDeviceEasyGo({super.key});

//   @override
//   State<GPSDeviceEasyGo> createState() => _GPSDeviceEasyGoState();
// }

// class _GPSDeviceEasyGoState extends State<GPSDeviceEasyGo> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex =
//       CameraPosition(target: LatLng(-6.3263292, 106.603353), zoom: 9);

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.83349,
//       target: LatLng(-6.3263292, 106.603353),
//       tilt: 59.440717,
//       zoom: 12);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.normal,
//         gestureRecognizers: Set()
//           ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
//           ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
//           ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
//           ..add(Factory<VerticalDragGestureRecognizer>(
//               () => VerticalDragGestureRecognizer()))
//           ..add(Factory<OneSequenceGestureRecognizer>(
//               () => new EagerGestureRecognizer())),
//         initialCameraPosition: _kGooglePlex,
//         markers: Get.find<DeviceEasyGoController>().markers,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToTheLake,
//       //   label: const Text('To the lake!'),
//       //   icon: const Icon(Icons.directions_boat),
//       // ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }
