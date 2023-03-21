import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/geofence/geofence_controller.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';
import 'package:trackingapp/utils/style.dart';

class ListGeofence extends StatelessWidget {
  ListGeofence({super.key});
  bool selected = false;

  final geofenceList = Get.find<GeofenceController>().listGeofence.value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Obx(() => (Get.find<GeofenceController>().isLoading.value)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.5,
                  ),
                  const CircularProgressIndicator(
                    color: MyStyle.primaryColor,
                    strokeWidth: 5,
                  ),
                ],
              )
            : ListView(
                children: [
                  for (final i in geofenceList!.geofencesItems!.geofences)
                    (geofenceList!.geofencesItems == null)
                        ? Text('data')
                        : Row(
                            children: [
                              Checkbox(
                                  value: this.selected,
                                  onChanged: ((value) {})),
                              Text(i.name ?? ''),
                            ],
                          )
                ],
              )));
  }
}
