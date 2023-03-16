import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/api/devices/device_profider.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/ui/pages/home_page.dart';

void main() async {
  Get.lazyPut(() => DeviceController());
  Get.lazyPut(() => DeviceProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GPS',
      theme: ThemeData(primarySwatch: Colors.amber, useMaterial3: true),
      home: const Home(),
    );
  }
}
