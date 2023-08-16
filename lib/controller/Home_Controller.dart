import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internship_project/model/User_data.dart';
import 'package:internship_project/services/remote_services.dart';

class HomeController extends GetxController {
  Rx<UserData> userData = UserData(
    id: '32',
    name: 'salman',
    image: 'images/bitmoji.png',
    age: '29',
    designation: '323',
    cnic: 'd2323-232',
  ).obs;
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    try {
      // UserData user = await DataService.fetchData();
      // userData.value = user;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
