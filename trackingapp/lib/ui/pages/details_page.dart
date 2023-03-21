import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/ui/component/details/detail_content.dart';
import 'package:trackingapp/ui/component/details/details_gps.dart';

class DeviceDetail extends StatelessWidget {
  const DeviceDetail(this.detailData, Future deviceId, {super.key});

  final Items detailData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(detailData.name)),
      body: ListView(
        children: [
          DetailsGPSMap(),
          new Container(
            height: Get.height * 0.5,
            child: DetailContent(detailData),
          )
        ],
      ),
    );
  }
}
