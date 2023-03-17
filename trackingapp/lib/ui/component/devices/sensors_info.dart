import 'package:flutter/material.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';

class SensorsInfo extends StatelessWidget {
  const SensorsInfo(this.detailData, {super.key});

  final Items detailData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.sensors_rounded),
            Text('Sensors'),
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        (detailData.sensors.isEmpty)
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('No Sensors'),
              )
            : Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(4)
                },
                children: [
                  for (final i in detailData.sensors)
                    TableRow(children: [Text('${i.name}:'), Text(i.value)])
                ],
              ),
      ],
    );
  }
}
