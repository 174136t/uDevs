import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/models/loginModel.dart';

saveCurrentLogin(Map res) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();


  var user;
  if ((res != null && res.isNotEmpty)) {
    user = LoginModel.fromJson(res).userType;
  } else {
    user = "";
  }
  var token = (res != null && res.isNotEmpty) ? LoginModel.fromJson(res).token : "";
  var email = (res != null && res.isNotEmpty) ? LoginModel.fromJson(res).email : "";
  var userId = (res != null && res.isNotEmpty) ? LoginModel.fromJson(res).userId : 0;

  await preferences.setString('LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString('LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('LastEmail', (email != null && email.length > 0) ? email : "");
  await preferences.setInt('LastUserId', (userId != null && userId > 0) ? userId : 0);

}