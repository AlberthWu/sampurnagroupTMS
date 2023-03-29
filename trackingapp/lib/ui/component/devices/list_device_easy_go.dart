import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_easy_go_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/ui/pages/details_page_easy_go.dart';

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
                              value: data.selected,
                              onChanged: ((value) {
                                data.selected = value!;
                                Get.find<DeviceEasyGoController>().onReady();
                              })),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.nopol,
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
                              onPressed: () {
                                Get.to(DeviceDetailsEasyGo(data));
                              },
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
