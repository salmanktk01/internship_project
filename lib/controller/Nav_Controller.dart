import 'package:get/get.dart';

class navbarcontroller extends GetxController {
  RxInt navindex = 0.obs;
  void changenav(int index) {
    navindex.value = index;
  }
}
