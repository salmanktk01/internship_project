import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// We Will Use this class for making the UI desgin of secret key ,CNIC and provided code *
class CustomFormPage extends StatelessWidget {
  const CustomFormPage(
      {super.key,
      required this.text,
      required this.hinttext,
      required this.onpressed,
      required this.edittext});
  final String text;
  final String hinttext;
  final VoidCallback onpressed;
  final TextEditingController edittext;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 80,
              margin: const EdgeInsets.fromLTRB(20, 180, 20, 250),
              child: Image.asset('images/Logo.png'),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: TextField(
                cursorColor: Colors.white,
                controller: edittext,
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle: const TextStyle(
                    color: Color(0xFF45B474),
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: const Color(0xFFE9F6ED),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xffD5E4E9)),
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Color(0xffD5E4E9)),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Container(
                width: 400,
                height: 60,
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: ElevatedButton(
                  onPressed: onpressed,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(width: 2, color: Colors.white),
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    'Next ',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2C7890)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
