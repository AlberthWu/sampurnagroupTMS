import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/ui/component/devices/all_device.dart';
import 'package:trackingapp/ui/component/devices/gps_device_easy_go.dart';
import 'package:trackingapp/ui/component/devices/list_device_transtrack.dart';
import 'package:trackingapp/ui/component/devices/search_bart.dart';
import 'package:trackingapp/ui/pages/details_page_easy_go.dart';

class ListDeviceEasyGo extends StatelessWidget {
  const ListDeviceEasyGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => ListView(
          scrollDirection: Axis.vertical,
          children: [
            //         IconButton(
            //             onPressed: () {
            //               Get.to(() => ListDeviceTranstrack());
            //             },
            //             icon: Icon(Icons.turn_right_outlined)),
            // Padding(
            // padding: const EdgeInsets.fromLTRB(20, 8, 50, 0),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text('Easy Go'),
            //       TextButton(
            //         onPressed: () {
            //           if (data.group_member.isNotEmpty) {
            //             Get.find<DevicesController>().isShow.value =
            //                 !Get.find<DevicesController>().isShow.value;
            //           } else {
            //             Get.back();
            //             Future.delayed(const Duration(), (() {
            //               Get.until((route) => Get.currentRoute == '/');
            //               Future.delayed(const Duration(), (() {
            //                 Get.find<GetTabController>().onItemTapped(2);
            //               }));
            //             }));
            //           }
            //         },
            //         style: const ButtonStyle(),
            //         child: (data.group_member.isNotEmpty)
            //             ? Text(
            //                 key: const Key('hide_show'),
            //                 Get.find<DevicesController>().isShow.value
            //                     ? 'Hide'
            //                     : 'Show',
            //                 style: const TextStyle(color: Colors.amber),
            //               )
            //             : const Text('You',
            //                 style: TextStyle(color: Colors.amber)),
            //       ),
            //     ],
            //   ),
            // ),
            (Get.find<DevicesController>().isLoading.value)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : (Get.find<DevicesController>()
                        .listDeviceEasyGo
                        .value!
                        .data
                        .isEmpty)
                    ? const Padding(
                        padding: EdgeInsets.all(80.0),
                        child: Center(
                          child: Text(
                            'Data Not Found',
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          for (final Data data in Get.find<DevicesController>()
                              .listDeviceEasyGo
                              .value!
                              .data
                              .toList())
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Checkbox(
                                      value: data.selected.value,
                                      onChanged: ((value) {
                                        data.selected.value = value ?? false;
                                        // print('ini onchanged ${{data.selected}}');
                                        Get.find<DevicesController>().onInit();
                                      })),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.nopol,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                                    color: (data.acc == 0)
                                        ? Colors.red
                                        : Colors.green,
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
        ),
      ),
      // ),
    );
  }
}
