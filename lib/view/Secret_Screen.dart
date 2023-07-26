import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/controller/CustomformController.dart';
import 'package:internship_project/view/CNIC_Screen.dart';
import 'package:internship_project/view/Custom_Class.dart';

class SecretScreen extends StatelessWidget {
  final cfc = Get.find<CustomFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C7890),
      body: Form(
        key: cfc.secretFormkey,
        child: CustomFormPage(
          text: 'PLEASE ENTER YOUR SECRET KEY',
          hinttext: 'SECRET KEY',
          onpressed: () {
            String? errorMessage = cfc.validateSecretKey();
            if (errorMessage != null) {
              cfc.showValidationErrorDialog(context, errorMessage);
            } else {
              cfc.validateAndProceed(context, "SECRET KEY");
            }
          },
          edittext: cfc.secretController,
        ),
      ),
    );
  }
}
