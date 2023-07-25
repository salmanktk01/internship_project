import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internship_project/view/QR_Genrate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 60,
            margin: const EdgeInsets.fromLTRB(10, 40, 20, 40),
            child: Image.asset('images/LOGO2.png'),
          ),
          Container(
            width: 350,
            height: 450,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffBBBBBB),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                    child: Image.asset('images/bitmoji.png'),
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name'),
                        SizedBox(
                          height: 2,
                        )
                      ],
                    ),
                    titleTextStyle: TextStyle(
                        color: Color(0xffAEAEAE),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                    subtitle: Text('M.Salman'),
                    subtitleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    trailing: Icon(Icons.edit),
                  ),
                  const Divider(
                    height: 3,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Age'),
                        SizedBox(
                          height: 2,
                        )
                      ],
                    ),
                    titleTextStyle: TextStyle(
                        color: Color(0xffAEAEAE),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                    subtitle: Text('28'),
                    subtitleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    trailing: Icon(Icons.edit),
                  ),
                  const Divider(
                    height: 3,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Designation'),
                        SizedBox(
                          height: 2,
                        )
                      ],
                    ),
                    titleTextStyle: TextStyle(
                        color: Color(0xffAEAEAE),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                    subtitle: Text('Frontend'),
                    subtitleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    trailing: Icon(Icons.edit),
                  ),
                  const Divider(
                    height: 3,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CNIC'),
                        SizedBox(
                          height: 2,
                        )
                      ],
                    ),
                    titleTextStyle: TextStyle(
                        color: Color(0xffAEAEAE),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                    subtitle: Text('14301-323313-7'),
                    subtitleTextStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    trailing: Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
          Container(
              width: 400,
              height: 60,
              margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const thirdScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2C7890),
                    side: const BorderSide(width: 2, color: Color(0xff2C7890)),
                    elevation: 25,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(
                  'Generate QR ',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
