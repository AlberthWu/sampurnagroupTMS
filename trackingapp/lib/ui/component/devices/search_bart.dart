import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/device_controller.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/ui/pages/route_device.dart';
import 'package:trackingapp/utils/style.dart';

class SearchBar extends GetView<DeviceController> {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8.0, top: 10, bottom: 2),
          child: AnimSearchBar(
            rtl: true,
            // autoFocus: true,
            // textFieldColor: MyStyle.primaryColor,
            // searchIconColor: MyStyle.secondaryColor,
            // color: MyStyle.primaryColor,
            // textFieldIconColor: MyStyle.secondaryColor,
            boxShadow: false,
            width: MediaQuery.of(context).size.width * 0.945,
            helpText: hintText(),
            textController: Get.find<DevicesController>().keywordController,
            onSuffixTap: () {},
            onSubmitted: (p0) async {
              if (Get.find<NewMyTabController>().selectedIndex == 0) {
                final keywordData =
                    Get.find<DevicesController>().keywordController;
                if (keywordData.text == '') {
                  await Get.find<DevicesController>().deviceListEasyGo();
                } else {
                  final listNopol = keywordData.text.split(',');
                  await Get.find<DevicesController>()
                      .deviceListEasyGoBySearch(listNopol.toList());
                }
              } else if (Get.find<NewMyTabController>().selectedIndex == 1) {
                final keywordData =
                    Get.find<DevicesController>().keywordController;
                if (keywordData.text == '') {
                  await Get.find<DevicesController>().deviceListTranstrack();
                } else {
                  await Get.find<DevicesController>()
                      .deviceListTranstrackbySearch(keywordData.text);
                }
              }
            },
          ),
        ),
      ],
    );
  }
}

hintText() {
  if (Get.find<NewMyTabController>().selectedIndex == 0) {
    return 'Type 1-3 nopol';
  } else if (Get.find<NewMyTabController>().selectedIndex == 1) {
    return 'Type some keyword';
  }
}
