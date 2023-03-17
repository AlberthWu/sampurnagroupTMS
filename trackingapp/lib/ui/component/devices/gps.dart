import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/ui/component/devices/detail.dart';

class GPSMap extends StatelessWidget {
  GPSMap({super.key});

  bool selected = false;

  @override
  final DeviceController deviceController = Get.put(DeviceController());
  Widget build(_) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Container(
              color: Colors.grey,
              height: Get.height * 0.4,
              width: Get.width,
              child: const Text('Maps')),
        ],
      ),
    );
  }
}
