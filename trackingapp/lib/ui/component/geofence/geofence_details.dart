import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';
import 'package:trackingapp/ui/component/geofence_details/details_geofence_gps.dart';
import 'package:trackingapp/ui/component/geofence_details/details_info_geofence.dart';

class GeofenceDetails extends StatelessWidget {
  const GeofenceDetails(this.i, {super.key});

  final Geofences i;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i.name),
      ),
      body: ListView(
        children: <Widget>[
          GeofenceGPSMapDetails(i),
          new Container(
            height: Get.height * 0.16,
            child: DetailsGeofence(i),
          )
        ],
      ),
    );
  }
}
