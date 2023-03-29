import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';

class DetailsContentEasyGo extends StatelessWidget {
  const DetailsContentEasyGo(this.data, {super.key});
  final Data data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 12),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.assistant_navigation),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(data.nopol),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: data.acc == 0 ? Colors.red : Colors.green,
                        ),
                        Text(data.currentStatusVehicle!.ket)
                      ],
                    ),
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(4),
                  },
                  children: [
                    TableRow(children: [
                      const Text('Address:'),
                      Text(data.addr ?? '-'),
                    ]),
                    TableRow(children: [
                      const Text('Position:'),
                      Text(
                          '(${data.lat.toStringAsFixed(6)} , ${data.lon.toStringAsFixed(6)})'),
                    ]),
                    TableRow(children: [
                      const Text('Device: '),
                      Text(data.groupNm ?? '-')
                    ]),
                    TableRow(children: [
                      const Text('Driver:'),
                      Text(data.driverNm ?? '-'),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.sensors_rounded),
                    Text('Sensors')
                  ],
                ),
                const Divider(
                  thickness: 2,
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(4)
                  },
                  children: [
                    TableRow(children: [
                      const Text('Battery:'),
                      Text('${data.bateryPercent.toStringAsFixed(3)} v'),
                    ]),
                    TableRow(children: [
                      const Text('Daya Aki: '),
                      Text('${data.mainPowerVoltage.toStringAsFixed(3)} v')
                    ]),
                    TableRow(children: [
                      const Text('Odometer:'),
                      Text('${data.odometer.toStringAsFixed(2)} Km'),
                    ]),
                    TableRow(children: [
                      const Text('GPS sat/GSM:'),
                      Text('${data.gpsSatelit} / ${data.gsmSignal}'),
                    ]),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: const [Icon(Icons.timelapse), Text('Report')],
                ),
                const Divider(
                  thickness: 2,
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(4)
                  },
                  children: [
                    TableRow(children: [
                      const Text('Status From:'),
                      Text(((data.sTime ?? '').replaceAll('T', ' '))
                          .split('.')
                          .first),
                    ]),
                    TableRow(children: [
                      const Text('Total KM Today: '),
                      Text('${data.totalkmToday.totalKm} Km')
                    ]),
                    TableRow(children: [
                      const Text('Total KM MTD:'),
                      Text('${data.totalkmMtd.totalKm} Km'),
                    ]),
                    TableRow(children: [
                      const Text('Total KM YTD:'),
                      Text('${data.totalkmYtd.totalKm} Km'),
                    ]),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
