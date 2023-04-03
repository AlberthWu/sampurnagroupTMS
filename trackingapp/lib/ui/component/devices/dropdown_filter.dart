import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/bussiness_logic/controller/devices/devices_controller.dart';
import 'package:trackingapp/ui/pages/route_device.dart';

class DropdownFilter extends GetView<DevicesController> {
  const DropdownFilter({super.key});

  @override
  Widget build(_) {
    return DropdownButtonHideUnderline(child: itemsList());
  }
}

class FilterItem {
  final String status;
  final IconData icon;
  final Color color;

  const FilterItem(
      {required this.status, required this.icon, required this.color});
}

class FilterItems {
  static const List<FilterItem> menuFilterEasyGo = [all, driving, parking];

  static const List<FilterItem> menuFilterTranstrack = [
    all,
    ack,
    offline,
    online,
    engine
  ];

  static const all = FilterItem(
    status: 'All',
    icon: Icons.circle,
    color: Colors.white,
  );

  static const parking = FilterItem(
    status: 'Parking',
    icon: Icons.circle,
    color: Colors.red,
  );

  static const driving =
      FilterItem(status: 'Driving', icon: Icons.circle, color: Colors.green);

  static const ack = FilterItem(
    status: 'ACK',
    icon: Icons.circle,
    color: Colors.black,
  );

  static const offline = FilterItem(
    status: 'Offline',
    icon: Icons.circle,
    color: Colors.red,
  );

  static const online =
      FilterItem(status: 'Online', icon: Icons.circle, color: Colors.green);

  static const engine =
      FilterItem(status: 'Engine', icon: Icons.circle, color: Colors.amber);

  static Widget buildItem(FilterItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: item.color,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.status,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  static onChanged(_, FilterItem item) {
    if (Get.find<NewMyTabController>().selectedIndex == 0) {
      switch (item) {
        case FilterItems.all:
          Get.reload();
          break;
        case FilterItems.driving:
          break;
        case FilterItems.parking:
          break;
      }
    } else if (Get.find<NewMyTabController>().selectedIndex == 1) {
      switch (item) {
        case FilterItems.all:
          Get.reload();
          break;
        case FilterItems.ack:
          break;
        case FilterItems.offline:
          break;
        case FilterItems.online:
          break;
        case FilterItems.engine:
          break;
      }
    }
  }
}

itemsList() {
  final items;
  if (Get.find<NewMyTabController>().selectedIndex == 0) {
    return DropdownButton2(
      customButton: const Padding(
        padding: EdgeInsets.only(right: 24.0, top: 24, bottom: 24),
        child: Icon(
          Icons.list,
          size: 20,
          color: Colors.black,
        ),
      ),
      items: [
        ...FilterItems.menuFilterEasyGo.map(
          (e) => DropdownMenuItem<FilterItem>(
            child: FilterItems.buildItem(e),
            value: e,
          ),
        )
      ],
      onChanged: (value) {
        FilterItems.onChanged(_, value as FilterItem);
      },
      dropdownStyleData: DropdownStyleData(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.blueGrey,
          ),
          elevation: 1,
          offset: const Offset(10, 8)),
      menuItemStyleData: MenuItemStyleData(customHeights: [
        ...List<double>.filled(FilterItems.menuFilterEasyGo.length, 48)
      ], padding: const EdgeInsets.only(left: 16, right: 16)),
    );
  } else if (Get.find<NewMyTabController>().selectedIndex == 1) {
    return DropdownButton2(
      customButton: const Padding(
        padding: EdgeInsets.only(right: 24.0, top: 24, bottom: 24),
        child: Icon(
          Icons.list,
          size: 20,
          color: Colors.black,
        ),
      ),
      items: [
        ...FilterItems.menuFilterTranstrack.map(
          (e) => DropdownMenuItem<FilterItem>(
            child: FilterItems.buildItem(e),
            value: e,
          ),
        )
      ],
      onChanged: (value) {
        FilterItems.onChanged(_, value as FilterItem);
      },
      dropdownStyleData: DropdownStyleData(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.blueGrey,
          ),
          elevation: 1,
          offset: const Offset(10, 8)),
      menuItemStyleData: MenuItemStyleData(customHeights: [
        ...List<double>.filled(FilterItems.menuFilterTranstrack.length, 48)
      ], padding: const EdgeInsets.only(left: 16, right: 16)),
    );
  }
}

mixin _ {}
