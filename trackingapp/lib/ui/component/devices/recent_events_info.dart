import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/events/events_controller.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';
import 'package:trackingapp/bussiness_logic/model/events/events_model.dart';

class RecentEventsInfo extends StatelessWidget {
  const RecentEventsInfo(this.detailData, {super.key});

  final int detailData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.notifications),
            Text('Recent Events'),
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        (Get.find<EventsController>().listEvents.value?.itemEvents.dataEvents ==
                null)
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('No Data Events'),
              )
            : Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(4)
                },
                children: [
                  for (final DataEvents listEvents
                      in Get.find<EventsController>()
                          .listEvents
                          .value!
                          .itemEvents
                          .dataEvents
                          .toList())
                    TableRow(children: [
                      Text('Jam'),
                      (listEvents.type == '')
                          ? Text('No Data')
                          : (listEvents.type == 'zone_out')
                              ? Text('Geofence Out')
                              : Text('Geofence In')
                    ])
                ],
              ),
      ],
    );
  }
}
