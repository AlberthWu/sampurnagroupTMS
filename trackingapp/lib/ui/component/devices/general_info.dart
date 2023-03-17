import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_model.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo(this.detailData, {super.key});

  final Items detailData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.assistant_navigation),
                Text(detailData.name),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: (detailData.iconColor == 'black')
                      ? Colors.black
                      : (detailData.iconColor == 'green')
                          ? Colors.green
                          : (detailData.iconColor == 'red')
                              ? Colors.red
                              : (detailData.iconColor == 'yellow')
                                  ? Colors.amber
                                  : Colors.grey,
                ),
                Text(detailData.online.toUpperCase())
              ],
            )
          ],
        ),
        const Divider(
          thickness: 2,
        ),
        (detailData == null)
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Please Try Again'),
              )
            : Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(4)
                },
                children: [
                  TableRow(children: [
                    const Text('Address: '),
                    Text(detailData.address)
                  ]),
                  TableRow(
                      children: [const Text('Time: '), Text(detailData.time)]),
                  TableRow(children: [
                    const Text('Stop Duration: '),
                    Text(detailData.stopDuration)
                  ]),
                  TableRow(children: [
                    const Text('Driver: '),
                    Text(detailData.driver)
                  ]),
                ],
              ),
      ],
    );
  }
}
