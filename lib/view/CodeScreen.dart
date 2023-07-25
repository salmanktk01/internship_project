import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/view/Custom_Class.dart';

import 'package:internship_project/view/Root_Page.dart';

class CodeScreen extends StatelessWidget {
  final GlobalKey<FormState> _SecretCodekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2C7890),
        body: CustomFormPage(
          text: "PLEASE ENTER YOUR PROVIDED CODE",
          hinttext: "PROVIDED CODE",
          onpressed: () => Get.to(BottomNavBar()),
          edittext: TextEditingController(),
        ));
  }
}
