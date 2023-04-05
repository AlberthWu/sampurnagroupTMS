import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/geofence/geofence_controller.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';
import 'package:trackingapp/ui/component/geofence/geofence_details.dart';
import 'package:trackingapp/ui_logic/loading/get_data.dart';
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
            ? LoadingGetData()
            : ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final i in geofenceList!.geofencesItems!.geofences)
                    (geofenceList!.geofencesItems == null)
                        ? Text('data')
                        : InkWell(
                            onTap: () {
                              final int id = i.id;
                              Get.to(GeofenceDetails(i));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                  height: Get.height,
                                  width: Get.width * 0.4,
                                  color: Colors.amber,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(i.name),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                ],
              )));
  }
}
