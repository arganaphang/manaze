import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/application_controller.dart';
import 'package:manaze/screens/home/chart/chart_screen.dart';
import 'package:manaze/screens/home/home_screen_controller.dart';
import 'package:manaze/screens/home/setting/setting_screen.dart';
import 'package:manaze/screens/list/list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const routeName = '/home';
  final applicationController = Get.find<ApplicationController>();
  final homeController = Get.put(HomeScreenController());

  final screens = [ListScreen(), ChartScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.transparent,
          selectedIndex: homeController.selectedIndex.value,
          onDestinationSelected: homeController.onChange,
          destinations: const [
            NavigationDestination(
              icon: Icon(EvaIcons.homeOutline),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(EvaIcons.pieChartOutline),
              label: "Chart",
            ),
            NavigationDestination(
              icon: Icon(EvaIcons.settingsOutline),
              label: "Setting",
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Obx(() => screens[homeController.selectedIndex.value]),
        ),
      ),
    );
  }
}
