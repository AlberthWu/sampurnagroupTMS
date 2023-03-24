import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/geofence/geofence_controller.dart';
import 'package:trackingapp/ui/component/devices/gps.dart';
import 'package:trackingapp/ui/component/geofence/geofence_gps.dart';
import 'package:trackingapp/ui/component/geofence/list_geofence.dart';

class GeofencingPage extends StatelessWidget {
  const GeofencingPage({super.key});

  @override
  Widget build(_) => GetBuilder<GeofenceController>(
      init: GeofenceController(),
      builder: (listGeofence) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Geofence'),
          ),
          body: ListView(
            children: <Widget>[
              GeofenceGPSMap(),
              new Container(
                height: Get.height * 0.16,
                child: ListGeofence(),
              )
            ],
          ),
        );
      });
}
