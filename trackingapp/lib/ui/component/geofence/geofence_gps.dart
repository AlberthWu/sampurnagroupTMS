import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/geofence/geofence_controller.dart';

class GeofenceGPSMap extends StatelessWidget {
  GeofenceGPSMap({super.key});

  @override
  // final DeviceController deviceController = Get.put(DeviceController());
  Widget build(_) {
    return Container(
      height: Get.height * 0.67,
      width: Get.width,
      child: Obx(
        () => (Get.find<GeofenceController>().isLoading.value)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer()))
                  ..add(Factory<ScaleGestureRecognizer>(
                      () => ScaleGestureRecognizer()))
                  ..add(Factory<TapGestureRecognizer>(
                      () => TapGestureRecognizer()))
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
                initialCameraPosition: const CameraPosition(
                    target: LatLng(-6.3263292, 106.603353), zoom: 18),
                polygons: Get.find<GeofenceController>().polygon,
              ),
      ),
    );
  }
}
