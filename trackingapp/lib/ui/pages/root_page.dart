import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackingapp/ui/pages/geofencing_page.dart';
import 'package:trackingapp/ui/pages/history_page.dart';
import 'package:trackingapp/ui/pages/home_page.dart';
import 'package:trackingapp/ui/pages/device_page.dart';
import 'package:trackingapp/ui/pages/login_page.dart';
import 'package:trackingapp/ui/pages/profile_page.dart';
import 'package:trackingapp/utils/style.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MyTabController>(
      init: MyTabController(),
      builder: (tc) {
        var bottomBar = BottomNavigationBar(
          backgroundColor: MyStyle.primaryColor,
          unselectedItemColor: MyStyle.secondaryColor,
          unselectedLabelStyle: TextStyle(color: MyStyle.secondaryColor),
          selectedItemColor: MyStyle.buttonColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.gps_fixed), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Geofence'),
            BottomNavigationBarItem(
                icon: Icon(Icons.mark_as_unread), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: tc.selectedIndex.value,
          onTap: tc.onItemTapped,
        );
        return Scaffold(
          body: Center(
              child: TabBarView(
            children: tc.widgetOptions,
            physics: NeverScrollableScrollPhysics(),
            controller: tc.tabController,
          )),
          bottomNavigationBar: bottomBar,
        );
      },
    );
  }
}

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final RxInt selectedIndex = 0.obs;

  final List<Widget> widgetOptions = <Widget>[
    // HomePage(),
    DevicePage(),
    GeofencingPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void onItemTapped(int index) {
    tabController.animateTo(index);
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }
}
