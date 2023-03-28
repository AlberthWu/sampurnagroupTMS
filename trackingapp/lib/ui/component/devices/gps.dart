// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// // import 'package:geocoding/geocoding.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
// import 'package:trackingapp/bussiness_logic/controller/devices/gps_controller.dart';
// import 'package:trackingapp/ui/pages/details_page.dart';

// // class GPSMap extends StatelessWidget {
// //   GPSMap({super.key});

// //   bool selected = false;

// //   final DeviceController deviceController = Get.find();

// //   @override
// //   // final DeviceController deviceController = Get.put(DeviceController());
// //   Widget build(_) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 8.0),
// //       child: Container(
// //         color: Colors.grey,
// //         height: Get.height * 0.4,
// //         width: Get.width,
// //         // child: GoogleMap(
// //         //   mapType: MapType.normal,
// //         //   initialCameraPosition: CameraPosition(
// //         //     target: LatLng(3.595196, 98.672226),
// //         //     zoom: 14.0,
// //         //   ),
// //         child: Text('data'),
// //       ),
// //     );
// //   }
// // }

// class GPSMap extends StatefulWidget {
//   const GPSMap({super.key});

//   @override
//   State<GPSMap> createState() => _GPSMapState();
// }

// class _GPSMapState extends State<GPSMap> {
//   // final Completer<GoogleMapController> _controller =
//   //     Completer<GoogleMapController>();

//   // static const CameraPosition _kGooglePlex = CameraPosition(
//   //   target: LatLng(37.42796133580664, -122.085749655962),
//   //   zoom: 14.4746,
//   // );

//   // static const CameraPosition _kLake = CameraPosition(
//   //     bearing: 192.8334901395799,
//   //     target: LatLng(37.43296265331129, -122.08832357078792),
//   //     tilt: 59.440717697143555,
//   //     zoom: 19.151926040649414);

//   DeviceController deviceController = Get.put(DeviceController());

//   // List<Placemark> placeMarks = await placemarkFromCoordinates(deviceController., longitude)

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     deviceController.listItem();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
//         // Container(
//         //     height: Get.height * 0.4,
//         //     child: GoogleMap(
//         //       mapType: MapType.normal,
//         //       gestureRecognizers: Set()
//         //         ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
//         //         ..add(
//         //             Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
//         //         ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
//         //         ..add(Factory<VerticalDragGestureRecognizer>(
//         //             () => VerticalDragGestureRecognizer())),
//         //       initialCameraPosition: _kGooglePlex,
//         //       onMapCreated: (GoogleMapController controller) {
//         //         _controller.complete(controller);
//         //       },
//         //       // markers: Icon(Icons.mail)
//         //     ));
//         Container(
//       height: Get.height * 0.4,
//       child: Obx(
//         () => deviceController.itemsModel.isNotEmpty
//             ? GoogleMap(
//                 mapType: MapType.normal,
//                 gestureRecognizers: Set()
//                   ..add(Factory<PanGestureRecognizer>(
//                       () => PanGestureRecognizer()))
//                   ..add(Factory<ScaleGestureRecognizer>(
//                       () => ScaleGestureRecognizer()))
//                   ..add(Factory<TapGestureRecognizer>(
//                       () => TapGestureRecognizer()))
//                   ..add(Factory<VerticalDragGestureRecognizer>(
//                       () => VerticalDragGestureRecognizer())),
//                 initialCameraPosition: const CameraPosition(
//                     target: LatLng(-6.3263292, 106.603353), zoom: 12),
//                 markers: deviceController.markers,
//               )
//             : const Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//     );
//   }

//   // Future<void> _goToTheLake() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';

class GPSMap extends StatelessWidget {
  GPSMap(this.listDevice, {super.key});

  final DeviceController listDevice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Obx(() => (listDevice.listDevice.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              gestureRecognizers: Set()
                ..add(
                    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                ..add(Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer()))
                ..add(
                    Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer()))
                ..add(Factory<OneSequenceGestureRecognizer>(
                    () => new EagerGestureRecognizer())),
              initialCameraPosition: const CameraPosition(
                  target: LatLng(-6.3263292, 106.603353), zoom: 12),
              markers: listDevice.markers,

              // onTap: ((argument) => Get.to(DeviceDetail(detailData, deviceId))),
            )),
    );
  }
}
