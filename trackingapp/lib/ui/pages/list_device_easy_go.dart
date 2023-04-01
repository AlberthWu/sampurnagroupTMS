import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';
import 'package:trackingapp/ui/component/devices/gps_device_easy_go.dart';
import 'package:trackingapp/ui/component/devices/list_device_easy_go.dart';

class DeviceEasyGo extends GetView<DeviceEasyGoController> {
  const DeviceEasyGo({super.key});

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Easy Go'),
        actions: [
          IconButton(
              onPressed: () {
                Get.find<DeviceEasyGoController>().onInit();
              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: Get.height * 0.5,
            child: GPSDeviceEasyGo(),
          ),
          new Container(
            height: Get.height * 0.33,
            child: ListDeviceEasyGo(),
          )
        ],
      ),
    );
  }
}
