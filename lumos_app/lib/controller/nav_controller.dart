import 'package:get/get.dart';

class NavController extends GetxController {
  var tabIndex = 0.obs;

  var cardIndex = 0.obs;

  void changeCardIndex(int index) {
    cardIndex.value = index;
    print("card index : $cardIndex");
  }

  int getCardIndex() {
    print("card index : $cardIndex");
    return cardIndex.value;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
    print(tabIndex);
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
