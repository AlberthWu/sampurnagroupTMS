import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/ui/component/devices/all_device.dart';
import 'package:trackingapp/ui/component/devices/gps_device_easy_go.dart';
import 'package:trackingapp/ui/component/devices/list_device_easy_go.dart';
import 'package:trackingapp/ui/pages/route_device.dart';

class DevicePage extends GetView<DevicesController> {
  const DevicePage({super.key});

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Easy Go'),
        actions: [
          IconButton(
              onPressed: () {
                Get.find<DevicesController>().onInit();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: Get.height * 0.45,
            child: GPSDevices(),
          ),
          new Container(
            height: Get.height * 0.38,
            // child: ListDeviceEasyGo(),
            // child: AllDevice(),
            child: RouteDevice(),
          )
        ],
      ),
    );
  }
}
