import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';

class DetailsGPSMap extends StatelessWidget {
  DetailsGPSMap(this.detailData, {super.key});

  final Items detailData;

  bool selected = false;

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // var markersDetail = Set<Marker>();

  // final marker = Marker(
  //     markerId: MarkerId(detailData.id.toString()),
  //     position: LatLng(detailData.lat, detailData.lng),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));

  @override
  // final DeviceController deviceController = Get.put(DeviceController());
  Widget build(_) {
    return Container(
      color: Colors.grey,
      height: Get.height * 0.4,
      width: Get.width,
      // child: GoogleMap(
      //   mapType: MapType.normal,
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(3.595196, 98.672226),
      //     zoom: 14.0,
      //   ),
      child: (detailData != null)
          ? GoogleMap(
              mapType: MapType.normal,
              gestureRecognizers: Set()
                ..add(
                    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                ..add(Factory<ScaleGestureRecognizer>(
                    () => ScaleGestureRecognizer()))
                ..add(
                    Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      detailData.lat.toDouble(), detailData.lng.toDouble()),
                  zoom: 15),
              markers: {
                  Marker(
                    markerId: MarkerId(detailData.id.toString() + 'details'),
                    position: LatLng(
                        detailData.lat.toDouble(), detailData.lng.toDouble()),
                  )
                })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
