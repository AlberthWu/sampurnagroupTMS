import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';
import 'package:trackingapp/bussiness_logic/services/geofence/geofence_repository.dart';
import 'package:trackingapp/ui/component/geofence/geofence_details.dart';

class GeofenceController extends GetxController {
  final Rxn<GeofenceModel> listGeofence = Rxn<GeofenceModel>();
  late List<Geofences> geofences = <Geofences>[].obs;
  var isLoading = false.obs;
  var isError = false.obs;
  var errmsg = "".obs;

  // List<LatLng> polygonLatLngs = <LatLng>[];

  var polygon = RxSet<Polygon>();

  late List<LatLng> pointsLatLng = [];
  // late final Polygon polygon;

  Dio dio = Dio();

  @override
  void onInit() {
    geofenceList();
    super.onInit();
  }

  Future geofenceList() async {
    isLoading(false);
    try {
      isLoading(true);
      final result = await GeofenceApi().getGeofenceList();
      isLoading(false);
      isError(false);
      listGeofence.value = result;
      for (var i in listGeofence.value!.geofencesItems!.geofences) {
        geofences.add(i);
        // final List<dynamic> pointsJSON = jsonDecode(i.coordinates);
        // pointsLatLng =
        //     pointsJSON.map((e) => LatLng(e['lat'], e['lng'])).toList();
      }
      // print(geofences);
      // print(pointsLatLng);
      return listGeofence;
    } catch (e) {
      isLoading(false);
      throw Exception(e);
    } finally {
      createPolygon();
    }
  }

  createPolygon() {
    geofences.forEach((element) async {
      final List<dynamic> point = jsonDecode(element.coordinates);
      pointsLatLng = point.map((e) => LatLng(e['lat'], e['lng'])).toList();
      polygon.add(
        Polygon(
          polygonId: PolygonId(element.id.toString()),
          points: pointsLatLng,
          fillColor: HexColor(element.polygonColor).withOpacity(0.15),
          strokeWidth: 2,
          strokeColor: HexColor(element.polygonColor),
        ),
      );
    });
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
