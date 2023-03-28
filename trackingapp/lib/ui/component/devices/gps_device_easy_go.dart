import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';

class GPSDeviceEasyGo extends StatelessWidget {
  const GPSDeviceEasyGo({super.key});

  // latLng(){
  //   for(var i in )
  // }

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
            initialCameraPosition: CameraPosition(
                target: LatLng(-6.3263292, 106.603353), zoom: 12),
            markers: Get.find<DeviceEasyGoController>().markers,
          ));
  }
}
