// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../model/User_data.dart'; // Add this import for json.decode

// class DataService {
//   static Future<UserData> fetchData() async {
//     var response =
//         await http.post(""); // Replace the URL with your API endpoint
//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       var jsonData = json.decode(jsonString); // Decode the JSON string
//       return UserData.fromJson(jsonData); // Pass the decoded JSON data
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
