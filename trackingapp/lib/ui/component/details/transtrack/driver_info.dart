import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo(this.detailData, {super.key});

  final Items detailData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.person),
            Text('Driver'),
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        (detailData.driverData == null)
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Not Found Location'),
              )
            : Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(4)
                },
                children: [
                  TableRow(children: [
                    const Text('Name: '),
                    Text(detailData.driverData.name ?? '-')
                  ]),
                  TableRow(children: [
                    const Text('RFID: '),
                    Text(detailData.driverData.rfid ?? '-')
                  ]),
                  TableRow(children: [
                    const Text('Phone: '),
                    Text(detailData.driverData.phone ?? '-')
                  ]),
                  TableRow(children: [
                    const Text('Email: '),
                    Text(detailData.driverData.email ?? '-')
                  ]),
                ],
              ),
      ],
    );
  }
}
