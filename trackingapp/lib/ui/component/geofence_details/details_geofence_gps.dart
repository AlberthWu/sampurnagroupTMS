import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/geofence/geofence_controller.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';

class GeofenceGPSMapDetails extends StatelessWidget {
  GeofenceGPSMapDetails(this.i, this.id, {super.key});

  final Geofences i;

  final int id;

  late List<LatLng> pointsLatLang = [];

  // createPolygon() {
  //   final List<dynamic> point = jsonDecode(i.coordinates);
  //   pointsLatLang = point.map((e) => LatLng(e['lat'], e['lng'])).toList();
  // }

  @override
  Widget build(_) {
    return Container(
      height: Get.height * 0.67,
      width: Get.width,
      child: (i == null)
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
                    () => VerticalDragGestureRecognizer())),
              initialCameraPosition: CameraPosition(
                  target: LatLng(pointsLatLang.first.latitude,
                      pointsLatLang.first.longitude),
                  zoom: 18),
              polygons: {
                Polygon(
                    polygonId: PolygonId(i.id.toString() + 'details'),
                    points: pointsLatLang,
                    fillColor: HexColor(i.polygonColor).withOpacity(0.2),
                    strokeColor: HexColor(i.polygonColor),
                    strokeWidth: 2)
              },
              // Get.find<GeofenceController>().polygon
            ),
    );
  }
}
