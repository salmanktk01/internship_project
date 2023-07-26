import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/view/Secret_Screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C7890),
      body: GestureDetector(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 180,
                height: 100,
                margin: const EdgeInsets.fromLTRB(20, 240, 20, 270),
                child: Image.asset('images/Logo.png'),
              ),
              Container(
                  width: 340,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => SecretScreen());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(width: 2, color: Colors.white),
                        elevation: 25,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text(
                      'GET STARTED ',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2C7890)),
                    ),
                  ))
            ],
          ),
        ),
        onTap: () {
          Get.to(() => SecretScreen());
        },
      ),
    );
  }
}
