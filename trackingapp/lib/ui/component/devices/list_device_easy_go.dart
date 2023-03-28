import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';

class ListDeviceEasyGo extends StatelessWidget {
  const ListDeviceEasyGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Get.find<DeviceEasyGoController>().isLoading.value)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: [
              Column(
                children: [
                  for (final Data data in Get.find<DeviceEasyGoController>()
                      .listDevice
                      .value!
                      .data
                      .toList())
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Checkbox(
                              value: Get.find<DeviceEasyGoController>()
                                  .isShow
                                  .value,
                              onChanged: ((
                                value,
                              ) {
                                Get.find<DeviceEasyGoController>()
                                    .isShow
                                    .value = value!;
                                Get.find<DeviceEasyGoController>().onReady();
                              })),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.nopol ?? '0',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(((data.gpsTime ?? '')
                                          .replaceAll('T', ' '))
                                      .split('+')
                                      .first),
                                  Text(' ${data.provinsi}')
                                ],
                              )
                            ],
                          ),
                          Text('${data.speed} kph'),
                          Icon(
                            Icons.circle,
                            color: (data.acc == 0) ? Colors.red : Colors.green,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_right))
                        ],
                      ),
                    )
                ],
              ),
            ],
          ));
  }
}
