// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart' as http;

// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';

 const hostUrl = "http://192.168.1.8:3000/users";

// class API {
//   String token;
//   _read() async {
//     final prefs = await SharedPreferences.getInstance();
//     token = prefs.getString('token');
//   }

//   static Future getUsers() {
//     _read();
//     var url = baseUrl;
//     return http.get(
//       url,
//       headers: {HttpHeaders.authorizationHeader: token},
//     );
//   }
// }
