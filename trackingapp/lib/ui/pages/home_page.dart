import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/ui/component/devices/gps.dart';
import 'package:trackingapp/ui/component/devices/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(_) => GetBuilder<DeviceController>(
      init: DeviceController(),
      builder: (listDevice) {
        return Scaffold(
          appBar: AppBar(title: const Text('Maps')),
          body: ListView(
            children: <Widget>[
              GPSMap(),
              new Container(
                height: Get.height * 0.5,
                child: ListDevice(),
              )
            ],
          ),
        );
      });
}
