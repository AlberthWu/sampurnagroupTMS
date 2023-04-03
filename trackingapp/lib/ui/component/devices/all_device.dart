import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/ui/component/devices/list_device_easy_go.dart';
import 'package:trackingapp/ui/component/devices/list_device_transtrack.dart';
import 'package:trackingapp/ui/pages/route_device.dart';

class AllDevice extends StatelessWidget {
  const AllDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return RouteDevice();
  }
}
