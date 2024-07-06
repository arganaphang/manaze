import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  final selectedIndex = 0.obs;

  void onChange(int idx) {
    selectedIndex.value = idx;
  }
}
