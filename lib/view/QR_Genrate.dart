import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class thirdScreen extends StatelessWidget {
  const thirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C7890),
      body: GestureDetector(
        child: Center(
          child: Column(
            children: [
              Container(
                  width: 230,
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(20, 100, 20, 40),
                  child: const CircularCountDownTimer(
                      width: 20,
                      height: 20,
                      duration: 30,
                      backgroundColor: Colors.white,
                      fillColor: Colors.red,
                      ringColor: Colors.white)),
              Container(
                width: 180,
                height: 180,
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 180),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/QR_Logo.png'),
                ),
              ),
              Container(
                width: 300,
                height: 70,
                margin: const EdgeInsets.fromLTRB(20, 120, 20, 20),
                child: Image.asset('images/QR_Code.png'),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
