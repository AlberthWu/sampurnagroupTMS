import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';

// class HistoryPage extends StatefulWidget {
//   const HistoryPage({super.key});

//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   DeviceController deviceController = Get.put(DeviceController());

//   @override
//   void initState() {
//     deviceController.deviceList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height * 0.5,
//       child: SafeArea(
//           child: Obx(
//         () => deviceController.listDevice.isNotEmpty
//             ? GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(deviceController.listDevice.first.items[0].lat,
//                       deviceController.listDevice.first.items[0].lng),
//                   zoom: 13,
//                 ),
//                 markers: deviceController.marker,
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//       )),
//     );
//   }
// }

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
