import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/controller/CustomformController.dart';
import 'package:internship_project/view/Custom_Class.dart';
import 'package:internship_project/view/Root_Page.dart';

class CodeScreen extends StatelessWidget {
  final cfc = Get.put(CustomFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C7890),
      body: Form(
        key: cfc.codeFormKey,
        child: CustomFormPage(
          text: "PLEASE ENTER YOUR PROVIDED CODE",
          hinttext: "PROVIDED CODE",
          onpressed: () {
            String? errorMessage = cfc.validateCode();
            if (errorMessage != null) {
              cfc.showValidationErrorDialog(context, errorMessage);
            } else {
              cfc.validateAndProceed(context, "PROVIDED CODE");
            }
          },
          edittext: cfc.codecontroller,
        ),
      ),
    );
  }
}
