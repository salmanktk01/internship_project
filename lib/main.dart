import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:internship_project/Binding.dart';
import 'package:internship_project/view/Secret_Screen.dart';
import 'package:internship_project/view/Start_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      initialBinding: Storebinding(),
    );
  }
}

// appRoutes() => [
//       GetPage(
//         name: '/BottomNavBar',
//         page: () => BottomNavBar(),
//         transition: Transition.leftToRightWithFade,
//         transitionDuration: Duration(milliseconds: 500),
//       ),
//       GetPage(
//         name: '/second',
//         page: () => QrScreen(),
//         middlewares: [MyMiddelware()],
//         transition: Transition.leftToRightWithFade,
//         transitionDuration: Duration(milliseconds: 500),
//       ),
//       GetPage(
//         name: '/third',
//         page: () => SettingScreen(),
//         middlewares: [MyMiddelware()],
//         transition: Transition.leftToRightWithFade,
//         transitionDuration: Duration(milliseconds: 500),
//       ),
//     ];

// class MyMiddelware extends GetMiddleware {
//   @override
//   GetPage? onPageCalled(GetPage? page) {
//     print(page?.name);
//     return super.onPageCalled(page);
//   }
// }
