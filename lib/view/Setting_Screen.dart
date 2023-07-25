import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 130, 20, 8),
          child: GestureDetector(
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ACCOUNT SETTINGS'),
                      SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                  titleTextStyle: TextStyle(
                      color: Color(0xff4EB271),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  subtitle: Text('Change the identity or Account'),
                  subtitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 20, 8),
          child: GestureDetector(
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DELETE ACCOUNT '),
                      SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                  titleTextStyle: TextStyle(
                      color: Color(0xff4EB271),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  subtitle: Text('Change the identity or Account'),
                  subtitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 20, 8),
          child: GestureDetector(
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('REPORT FRAUD'),
                      SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                  titleTextStyle: TextStyle(
                      color: Color(0xff4EB271),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  subtitle: Text('Report identity theft and fraud to CARE '),
                  subtitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 20, 8),
          child: GestureDetector(
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('HELP'),
                      SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                  titleTextStyle: TextStyle(
                      color: Color(0xff4EB271),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  subtitle: Text('FAQs and a help form '),
                  subtitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
          child: GestureDetector(
            child: Column(
              children: [
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LOGOUT'),
                      SizedBox(
                        height: 2,
                      )
                    ],
                  ),
                  titleTextStyle: TextStyle(
                      color: Color(0xff4EB271),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  subtitle: Text('Logout from app '),
                  subtitleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
