import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/controller/CustomformController.dart';
import 'package:internship_project/controller/Home_Controller.dart';
import 'package:internship_project/view/CNIC_Screen.dart';
import 'package:internship_project/view/Custom_Class.dart';

class SecretScreen extends StatelessWidget {
  final cfc = Get.put(CustomFormController());
  final hc = Get.put(Home_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C7890),
      body: CustomFormPage(
        text: 'PLEASE ENTER YOUR SECRET KEY',
        hinttext: 'SECRET KEY',
        onpressed: () {
          // Get.snackbar(
          //   'Title', // The title of the SnackBar
          //  // The message of the SnackBar
          //   snackPosition: SnackPosition.BOTTOM, // Set the position to top
          //   duration: Duration(seconds: 3),
          //   backgroundColor:
          //       Colors.transparent, // How long the SnackBar should be visible
          //   overlayColor:
          //       Colors.transparent, // The background color of the SnackBar
          //   colorText: Colors.white, // The text color of the SnackBar
          // );
          Get.to(CNICScreen());
        },
        edittext: hc.secret_key,
      ),
    );
  }
}
