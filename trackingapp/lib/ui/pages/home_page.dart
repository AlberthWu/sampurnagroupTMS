import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/ui/component/devices/gps.dart';
import 'package:trackingapp/ui/component/devices/list_device.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(_) => GetBuilder<DeviceController>(
      init: DeviceController(),
      builder: (listDevice) {
        return Scaffold(
          appBar: AppBar(title: const Text('Maps')),
          body: ListView(
            children: <Widget>[
              Container(height: Get.height * 0.5, child: GPSMap(listDevice)),
              new Container(
                height: Get.height * 0.33,
                child: ListDevice(),
              )
            ],
          ),
        );
      });
}

// final controller = Get.find<DeviceController>();

// class HomePage extends GetView<DeviceController> {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder<List<DeviceModel>>(
//       stream: controller.listDevice,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   for (var i in snapshot.data!)
//                     for (var j in i.items)
//                       ListTile(
//                         title: Text(j.speed.toString()),
//                         subtitle: Text(j.name),
//                       ),
//                 ],
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text(snapshot.error.toString());
//         }
//         return CircularProgressIndicator();
//       },
//     ));
//   }
// }
