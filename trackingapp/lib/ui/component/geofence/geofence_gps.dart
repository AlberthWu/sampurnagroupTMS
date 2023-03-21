import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/ui/pages/details_page.dart';

class GeofenceGPSMap extends StatelessWidget {
  GeofenceGPSMap({super.key});

  bool selected = false;

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  // final DeviceController deviceController = Get.put(DeviceController());
  Widget build(_) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: Colors.grey,
        height: Get.height * 0.4,
        width: Get.width,
        // child: GoogleMap(
        //   mapType: MapType.normal,
        //   initialCameraPosition: CameraPosition(
        //     target: LatLng(3.595196, 98.672226),
        //     zoom: 14.0,
        //   ),
        child: Text('data'),
      ),
    );
  }
}
