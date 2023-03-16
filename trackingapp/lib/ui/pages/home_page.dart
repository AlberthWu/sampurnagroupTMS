import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device_model.dart';
import 'package:trackingapp/ui/component/devices/content.dart';
import 'package:trackingapp/ui/component/devices/gps.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(_) => GetBuilder<DeviceController>(
      init: DeviceController(),
      builder: (listDevice) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Maps',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              GPSMap(),
            ],
          ),
        );
      });
}
