import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/bussiness_logic/controller/events/events_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/ui/component/devices/list_device_easy_go.dart';
import 'package:trackingapp/ui/pages/details_page.dart';

class ListDeviceTranstrack extends StatelessWidget {
  const ListDeviceTranstrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (Get.find<DevicesController>().isLoading.value)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                (Get.find<DevicesController>()
                        .listDeviceTranstrack
                        .value
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
                          for (final DeviceModel deviceModel
                              in Get.find<DevicesController>()
                                  .listDeviceTranstrack
                                  .toList())
                            for (var i in deviceModel.items)
                              // for (final De in Get.find<DevicesController>().items.value.toList())
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Checkbox(
                                        value: true, onChanged: ((value) {})),
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
                                          Get.to(() => DeviceDetail(
                                              detailData, deviceId));
                                        },
                                        icon: Icon(Icons.keyboard_arrow_right))
                                  ],
                                ),
                              )
                        ],
                      )
              ],
            ),
    );
  }
}
