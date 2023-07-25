import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/view/CodeScreen.dart';
import 'package:internship_project/view/Custom_Class.dart';

class CNICScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2C7890),
        body: CustomFormPage(
          text: 'PLEASE ENTER YOUR CNIC',
          hinttext: "CNIC NUMBER",
          onpressed: () => Get.to(CodeScreen()),
          edittext: TextEditingController(),
        ));
  }
}
