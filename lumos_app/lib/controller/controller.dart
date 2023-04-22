import 'package:get/get.dart';

class Controller extends GetxController {
  // var count = 0.obs;
  // increment() => count++;

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
