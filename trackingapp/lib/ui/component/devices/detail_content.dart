import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/ui/component/devices/detail.dart';
import 'package:trackingapp/ui/component/devices/general_info.dart';
import 'package:trackingapp/ui/component/devices/location_info.dart';
import 'package:trackingapp/ui/component/devices/sensors_info.dart';
import 'package:trackingapp/ui/component/devices/service_info.dart';

class DetailContent extends StatelessWidget {
  DetailContent(this.detailData, {super.key});

  final Items detailData;

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 10),
      child: Obx(() => (Get.find<DeviceController>().isLoading.value)
          ? Text('Loading')
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      GeneralInfo(detailData),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: SensorsInfo(detailData),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ServiceInfo(detailData),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: LocationInfo(detailData),
                      ),
                    ],
                  ),
                ],
              ),
            )),
    );
  }
}
