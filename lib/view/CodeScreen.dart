import 'dart:typed_data';
import 'package:convert/convert.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/controller/CustomformController.dart';
import 'package:internship_project/controller/Genrate_Certificate.dart';
import 'package:internship_project/view/Custom_Class.dart';
import 'package:pointycastle/ecc/api.dart';

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
              Uint8List message = Uint8List.fromList("Hello, world!".codeUnits);

              // Generate private key
              Uint8List privateKeyBytes = EntityCryptoModule()
                  .generatePrivateKey(
                      cfc.cnicController.text, cfc.codecontroller.text);
              print("Private Key: ${hex.encode(privateKeyBytes)}");

              // Generate public key
              ECPublicKey publicKey =
                  EntityCryptoModule().generatePublicKey(privateKeyBytes);

              // Sign message
              Uint8List signature =
                  EntityCryptoModule().signMessage(privateKeyBytes, message);
              print("Signature: ${hex.encode(signature)}");
            }
          },
          edittext: cfc.codecontroller,
        ),
      ),
    );
  }
}
