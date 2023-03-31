import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/ui/component/devices/gps_device_easy_go.dart';
import 'package:trackingapp/ui/component/devices/list_device_easy_go.dart';
import 'package:trackingapp/utils/style.dart';

class DeviceEasyGo extends StatelessWidget {
  const DeviceEasyGo({super.key});

  @override
  Widget build(_) => GetBuilder<DeviceEasyGoController>(
      init: DeviceEasyGoController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Maps Easy Go'),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                height: Get.height * 0.5,
                child: GPSDeviceEasyGo(),
              ),
              new Container(
                  height: Get.height * 0.33,
                  child: ListDeviceEasyGo(controller))
            ],
          ),
        );
      });
}
