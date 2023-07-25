import 'package:get/get.dart';

class CustomFormController extends GetxController {
  String? defaultNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your SECRET Code';
    }
    return null;
  }

  String? defaultCNICValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your CNIC Number';
    }
    return null;
  }

  String? defaultSecretcodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your PROVIDED Code';
    }
    return null;
  }
}
