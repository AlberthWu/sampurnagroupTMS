import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:trackingapp/bussiness_logic/model/device/device_easygo_model.dart';
import 'package:trackingapp/ui/component/details/easyGo/details_content_easygo.dart';
import 'package:trackingapp/ui/component/details/easyGo/details_gps_easygo.dart';

class DeviceDetailsEasyGo extends StatelessWidget {
  DeviceDetailsEasyGo(this.data, {super.key});

  final Data data;
  late DateTime? pickedDate;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.nopol),
        ),
        body: ListView(
          children: [
            DetailsGPSMapEasygo(data),
            new Container(
              height: Get.height * 0.35,
              child: DetailsContentEasyGo(data),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.amber,
          height: Get.height * 0.06,
          child: TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // void openShowDatePicker() async {
                    //   pickedDate = await ScrollDatePicker.showSimpleDatePicker(
                    //       context,
                    //       initialDate: DateTime(2022),
                    //       firstDate: DateTime(1960),
                    //       lastDate: DateTime(2023),
                    //       dateFormat: "yyyy-MM-dd",
                    //       locale: DateTimePickerLocale.id,
                    //       looping: true,
                    //       itemTextStyle: GoogleFonts.roboto(),
                    //       textColor: AppTheme.primaryColor);

                    //   c.dateController.text = DateFormat('yyyy-MM-dd')
                    //       .format(pickedDate ?? DateTime.now());
                    // }

                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('History Playback'),
                            TextButton(
                              onPressed: () {
                                Get.close(0);
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              child: const Text(
                'History Playback',
                style: TextStyle(color: Colors.black),
              )),
        ));
  }
}
