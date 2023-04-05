import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/ui/component/devices/all_device.dart';
import 'package:trackingapp/ui/component/devices/gps_devices.dart';
import 'package:trackingapp/ui/component/devices/list_device_transtrack.dart';
import 'package:trackingapp/ui/component/devices/search_bar.dart';
import 'package:trackingapp/ui/pages/details_page_easy_go.dart';
import 'package:trackingapp/ui_logic/loading/get_data.dart';
import 'package:trackingapp/utils/style.dart';

class ListDeviceEasyGo extends StatelessWidget {
  const ListDeviceEasyGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          // scrollDirection: Axis.vertical,
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
                ? LoadingGetData()
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
                              padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(96, 0, 0, 0),
                                        blurRadius: 2.0,
                                      )
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 8, 2, 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            Get.find<DevicesController>()
                                                    .cameraPosition
                                                    .value =
                                                CameraPosition(
                                                    target: LatLng(
                                                        data.lat, data.lon),
                                                    zoom: 20);
                                            print(Get.find<DevicesController>()
                                                .cameraPosition);
                                            Get.find<DevicesController>()
                                                .focusToPosition();
                                            // Get.find<DevicesController>()
                                            //     .focusToPosition();
                                          },
                                          icon: Icon(Icons.remove_red_eye)),
                                      // Checkbox(
                                      //     value: data.selected.value,
                                      //     onChanged: ((value) {
                                      //       data.selected.value = value ?? false;
                                      //       // print('ini onchanged ${{data.selected}}');
                                      //       Get.find<DevicesController>().onInit();
                                      //     })),
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
                                          ),
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
                                          icon:
                                              Icon(Icons.keyboard_arrow_right))
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}



// focusToPosition() async {
//   Completer<GoogleMapController> _controller = Completer();

//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
// }
