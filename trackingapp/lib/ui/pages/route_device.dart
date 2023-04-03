import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/ui/component/devices/dropdown_filter.dart';
import 'package:trackingapp/ui/component/devices/list_device_easy_go.dart';
import 'package:trackingapp/ui/component/devices/list_device_transtrack.dart';
import 'package:trackingapp/ui/component/devices/search_bart.dart';
import 'package:trackingapp/ui/pages/geofencing_page.dart';
import 'package:trackingapp/ui/pages/history_page.dart';
import 'package:trackingapp/ui/pages/home_page.dart';
import 'package:trackingapp/ui/pages/device_page.dart';
import 'package:trackingapp/ui/pages/login_page.dart';
import 'package:trackingapp/ui/pages/profile_page.dart';
import 'package:trackingapp/utils/style.dart';

class RouteDevice extends StatelessWidget {
  const RouteDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<NewMyTabController>(
      init: NewMyTabController(),
      builder: (tc) {
        var bottomBar = BottomNavigationBar(
          iconSize: 15,
          backgroundColor: MyStyle.primaryColor,
          unselectedItemColor: MyStyle.secondaryColor,
          unselectedLabelStyle: TextStyle(color: MyStyle.secondaryColor),
          selectedItemColor: MyStyle.buttonColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.gps_fixed), label: 'EasyGo'),
            BottomNavigationBarItem(
                icon: Icon(Icons.gps_fixed), label: 'Transtrack'),
          ],
          currentIndex: tc.selectedIndex.value,
          onTap: tc.onItemTapped,
        );
        return Scaffold(
          appBar: tc.selectedIndex.value == 0
              ? AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('EasyGo'),
                  actions: [SearchBar(), DropdownFilter()],
                  backgroundColor: Colors.white12,
                  elevation: 0,
                )
              : AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Transtrack'),
                  actions: [SearchBar(), DropdownFilter()],
                  backgroundColor: Colors.white12,
                  elevation: 0,
                ),
          body: Center(
              child: TabBarView(
            children: tc.widgetOptions,
            physics: NeverScrollableScrollPhysics(),
            controller: tc.tabController,
          )),
          bottomNavigationBar:
              Container(height: Get.height * 0.06, child: bottomBar),
        );
      },
    );
  }
}

class NewMyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final RxInt selectedIndex = 0.obs;

  final List<Widget> widgetOptions = <Widget>[
    ListDeviceEasyGo(),
    ListDeviceTranstrack()
  ];

  void onItemTapped(int index) {
    tabController.animateTo(index);
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
