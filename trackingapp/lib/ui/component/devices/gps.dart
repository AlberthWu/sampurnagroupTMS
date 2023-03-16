import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device_model.dart';
import 'package:trackingapp/ui/component/devices/content.dart';

class GPSMap extends StatelessWidget {
  const GPSMap({super.key});

  // late String dropdownObject = Get.find<DeviceController>().listDevice.value?.t

  @override
  Widget build(_) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Obx(() => Column(
            children: [
              Container(
                  color: Colors.grey,
                  height: Get.height * 0.4,
                  width: Get.width,
                  child: Text('Maps')),
              Row(
                children: [
                  Text('Object :'),
                  DropdownButton(items: Get.find<DeviceController>().listDevice.value.map(((e) {
                    return DropdownMenuItem(child: Text(e['title']))
                  }), onChanged: onChanged)
                ],
              )
              // for (final DeviceModel deviceList
              //     in Get.find<DeviceController>().listDevice.toList())
              //   Padding(
              //     padding: const EdgeInsets.all(28.0),
              //     child: Container(
              //       height: 20,
              //       child: Text(
              //         deviceList.title ?? 'NotFound',
              //         style: TextStyle(fontSize: 30, color: Colors.black),
              //       ),
              //     ),
              //   ),
            ],
          )),
    );
  }
}
