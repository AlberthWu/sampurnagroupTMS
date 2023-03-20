import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';

class LocationInfo extends StatelessWidget {
  const LocationInfo(this.detailData, {super.key});

  final Items detailData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Icon(Icons.home),
            Text('Location'),
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        (detailData.lat == '' && detailData.lng == '')
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Not Found Location'),
              )
            : Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(4)
                },
                children: const [
                  TableRow(children: [
                    Text('City: '),
                    Text('Please Connect to google')
                  ]),
                  TableRow(children: [
                    Text('Road: '),
                    Text('Please Connect to google')
                  ]),
                  TableRow(children: [
                    Text('House: '),
                    Text('Please Connect to google')
                  ]),
                  TableRow(children: [
                    Text('Zip: '),
                    Text('Please Connect to google')
                  ]),
                  TableRow(children: [
                    Text('Country: '),
                    Text('Please Connect to google')
                  ]),
                  TableRow(children: [
                    Text('State: '),
                    Text('Please Connect to google')
                  ]),
                  TableRow(children: [
                    Text('Address: '),
                    Text('Please Connect to google')
                  ]),
                ],
              ),
      ],
    );
  }
}
