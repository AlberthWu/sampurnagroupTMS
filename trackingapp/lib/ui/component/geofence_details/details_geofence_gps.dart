import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/controller/geofence/geofence_controller.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';

class GeofenceGPSMapDetails extends StatelessWidget {
  GeofenceGPSMapDetails(this.i, {super.key});

  final Geofences i;

  late List<LatLng> _pointsLatLang = [];

  @override
  Widget build(_) {
    return SizedBox(
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
              polygons: {
                Polygon(
                    polygonId: PolygonId(i.id.toString() + 'details'),
                    points: _pointsLatLang,
                    fillColor: HexColor(i.polygonColor).withOpacity(0.2),
                    strokeColor: HexColor(i.polygonColor),
                    strokeWidth: 2)
              },
              // Get.find<GeofenceController>().polygon,
              initialCameraPosition: CameraPosition(
                  target: LatLng(-6.3263292, 106.603353), zoom: 18),
            ),
    );
  }

  createPolygon() {
    final List<dynamic> point = jsonDecode(i.coordinates);
    _pointsLatLang = point.map((e) => LatLng(e['lat'], e['lng'])).toList();
    print(_pointsLatLang);
    print(point);
    return _pointsLatLang;
  }
}
