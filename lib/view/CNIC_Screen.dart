import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/controller/CustomformController.dart';
import 'package:internship_project/view/CodeScreen.dart';
import 'package:internship_project/view/Custom_Class.dart';

class CNICScreen extends StatelessWidget {
  final cfc = Get.find<CustomFormController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C7890),
      body: Form(
        key: cfc.cnicKeyFormKey,
        child: CustomFormPage(
          text: 'PLEASE ENTER YOUR CNIC',
          hinttext: 'CNIC NUMBER',
          onpressed: () {
            String? errorMessage = cfc.validateCNIC();
            if (errorMessage != null) {
              cfc.showValidationErrorDialog(context, errorMessage);
            } else {
              cfc.validateAndProceed(context, "CNIC NUMBER");
            }
          },
          edittext: cfc.cnicController,
        ),
      ),
    );
  }
}
