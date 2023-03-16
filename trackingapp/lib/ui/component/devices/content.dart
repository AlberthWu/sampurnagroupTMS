import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device_model.dart';

class ContentDevice extends StatelessWidget {
  const ContentDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
          () => ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                for (final DeviceModel deviceList
                    in Get.find<DeviceController>().listDevice.toList())
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Container(
                      height: 20,
                      child: Text(
                        deviceList.title ?? 'NotFound',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  )
              ])),
    );
  }
}
