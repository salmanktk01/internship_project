// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserData userFromJson(String str) => UserData.fromJson(json.decode(str));

String userToJson(UserData data) => json.encode(data.toJson());

class UserData {
  //ems and cuser ,creation date ,fingerprint,list symmetric key variable remains
  String id;
  String name;
  String image;
  String age;
  String designation;
  String cnic;

  UserData({
    required this.id,
    required this.name,
    required this.image,
    required this.age,
    required this.designation,
    required this.cnic,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        age: json["AGE"],
        designation: json["Designation"],
        cnic: json["CNIC"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "AGE": age,
        "Designation": designation,
        "CNIC": cnic,
      };
}
