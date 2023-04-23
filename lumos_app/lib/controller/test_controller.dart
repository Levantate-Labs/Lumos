import 'package:get/get.dart';

class LikeController extends GetxController {
  var like = 0.obs;

  void toggleLike() {
    like.value == 1 ? like.value = 0 : like.value = 1;
    print(like);
  }
}
