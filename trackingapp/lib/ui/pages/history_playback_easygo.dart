import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/ui/component/details/easyGo/details_content_easygo.dart';
import 'package:trackingapp/ui/component/details/easyGo/details_gps_easygo.dart';

class HistoryPlaybackEasyGo extends StatelessWidget {
  const HistoryPlaybackEasyGo(this.data, {super.key});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History ' + data.nopol),
      ),
      body: ListView(
        children: [
          DetailsGPSMapEasygo(data),
          new Container(
            height: Get.height * 0.35,
            child: DetailsContentEasyGo(data),
          ),
        ],
      ),
    );
  }
}
