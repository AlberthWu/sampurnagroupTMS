import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/controller/events/events_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/ui/component/devices/detail.dart';

class ListDevice extends StatelessWidget {
  ListDevice({super.key});
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Obx(() => (Get.find<DeviceController>().isLoading.value)
          ? Text('Loading')
          : ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  children: [
                    for (final DeviceModel deviceList
                        in Get.find<DeviceController>().listDevice.toList())
                      Column(
                        children: [
                          for (var i in deviceList.items)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Checkbox(
                                      value: this.selected,
                                      onChanged: ((value) {})),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [Text(i.name), Text(i.time)],
                                  ),
                                  Text('${i.speed.toString()} ' +
                                      '${i.distanceUnitHour}'),
                                  Icon(
                                    Icons.gps_fixed_sharp,
                                    color: (i.engineStatus == true)
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: (i.iconColor == 'black')
                                        ? Colors.black
                                        : (i.iconColor == 'green')
                                            ? Colors.green
                                            : (i.iconColor == 'red')
                                                ? Colors.red
                                                : (i.iconColor == 'yellow')
                                                    ? Colors.amber
                                                    : Colors.grey,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        final detailData = i;
                                        final deviceId =
                                            Get.find<EventsController>()
                                                .eventsList(i.id);
                                        Get.to(() =>
                                            DeviceDetail(detailData, deviceId));
                                      },
                                      icon: Icon(Icons.keyboard_arrow_right))
                                ],
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ],
            )),
    );
  }
}
