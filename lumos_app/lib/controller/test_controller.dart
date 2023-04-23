import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LikeController extends GetxController {
  var like = 0.obs;

  void toggleLike() {
    like.value == 1 ? like.value = 0 : like.value = 1;
    print(like);
  }
}

class RegController extends GetxController {
  var attend = 0.obs;

  void toggleReg() {
    attend.value == 1 ? attend.value = 0 : attend.value = 1;
    print(attend);
  }
}

class BookController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "some book type".obs;

  var listType;

  void setSelected(String value) {
    selected.value = value;
  }
}
