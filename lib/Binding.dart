import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:internship_project/controller/CustomformController.dart';
import 'package:internship_project/controller/Home_Controller.dart';
import 'package:internship_project/controller/Nav_Controller.dart';

class Storebinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<navbarcontroller>(() => navbarcontroller(), fenix: true);
    Get.lazyPut<Home_Controller>(() => Home_Controller());
    Get.lazyPut<CustomFormController>(() => CustomFormController(),
        fenix: true);
  }
}
