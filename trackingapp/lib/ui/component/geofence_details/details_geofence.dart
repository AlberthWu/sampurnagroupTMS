import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/geofence/geofence_controller.dart';
import 'package:trackingapp/bussiness_logic/model/geofence/geofence_model.dart';
import 'package:trackingapp/ui/component/geofence/geofence_details.dart';
import 'package:trackingapp/utils/style.dart';

class DetailsGeofence extends StatelessWidget {
  DetailsGeofence(this.i, {super.key});

  final Geofences i;

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
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        height: Get.height,
                        width: Get.width * 0.4,
                        color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(i.name),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )));
  }
}
