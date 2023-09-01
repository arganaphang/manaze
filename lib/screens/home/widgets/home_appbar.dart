import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manaze/screens/analytic/analytic_screen.dart';
import 'package:manaze/screens/setting/setting_screen.dart';
import 'package:manaze/widgets/icon_card.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _calendar(),
        _menu(),
      ],
    );
  }

  Widget _calendar() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.calendar_month),
        SizedBox(width: 4),
        Text("September 2023"),
      ],
    );
  }

  Widget _menu() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AnalyticScreen.routeName);
          },
          child: const IconCard(
            color: Colors.deepPurple,
            icon: Icons.bar_chart,
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            Get.toNamed(SettingScreen.routeName);
          },
          child: const IconCard(
            color: Colors.deepPurple,
            icon: Icons.settings,
          ),
        ),
      ],
    );
  }
}
