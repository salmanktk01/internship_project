import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/view/CNIC_Screen.dart';
import 'package:internship_project/view/CodeScreen.dart';
import 'package:internship_project/view/Custom_Class.dart';
import 'package:internship_project/view/Root_Page.dart';
import 'package:internship_project/view/Secret_Screen.dart';

class CustomFormController extends GetxController {
  //Controller use to save edit text field data
  final secretController = TextEditingController();
  final cnicController = TextEditingController();
  final codecontroller = TextEditingController();

  // Add a GlobalKey for the Secret Key Form
  final secretFormkey = GlobalKey<FormState>();
  final cnicKeyFormKey = GlobalKey<FormState>();
  final codeFormKey = GlobalKey<FormState>();

  String? validateSecretKey() {
    String inputValue = secretController.text.trim();

    if (inputValue.isEmpty) {
      return "Secret key can't be empty!";
    } else if (inputValue.length < 6) {
      return "Secret key can't be less than 6 characters";
    } else {
      return null;
    }
  }

  String? validateCNIC() {
    String inputValue = cnicController.text.trim();

    if (inputValue.isEmpty) {
      return "CNIC number can't be empty!";
    } else if (inputValue.length != 13) {
      return "Please enter 13 digit CNIC";
    } else {
      return null;
    }
  }

  String? validateCode() {
    String inputValue = codecontroller.text.trim();

    if (inputValue.isEmpty) {
      return "Provided code can't be empty!";
    } else if (inputValue.length < 6) {
      return "Provided code can't be less than 6 characters";
    } else {
      return null; // No validation error
    }
  }

  void validateAndProceed(BuildContext context, String fieldHint) {
    String? errorMessage;
    if (fieldHint.toUpperCase() == "SECRET KEY") {
      errorMessage = validateSecretKey();
    } else if (fieldHint.toUpperCase() == "CNIC NUMBER") {
      errorMessage = validateCNIC();
    } else if (fieldHint.toUpperCase() == "PROVIDED CODE") {
      errorMessage = validateCNIC();
    }

    if (errorMessage != null) {
      showValidationErrorDialog(context, errorMessage);
    } else {
      if (fieldHint.toUpperCase() == "SECRET KEY") {
        Get.to(() => CNICScreen());
      } else if (fieldHint.toUpperCase() == "CNIC NUMBER") {
        Get.to(() => CodeScreen());
      } else if (fieldHint.toUpperCase() == "PROVIDED CODE") {
        Get.to(() => BottomNavBar());
      }
    }
  }

  void showValidationErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => buildDialog(context, errorMessage),
    );
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  Widget buildDialog(BuildContext context, String errorMessage) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xff4D4D4D),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Image.asset(
                  'images/LOGO2.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                errorMessage,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
