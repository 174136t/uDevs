import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Client/clienthome.dart';
import 'package:udevs/Developer/devloperhome.dart';
import 'package:udevs/intro.dart';
//import 'devLogin.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Widget logo() {
  return Center(
    //child: CircleAvatar(
    child: Image(image: AssetImage('assets/abc.jpeg')),
    //     maxRadius: 60.0,
    //     minRadius: 20.0,
    //     backgroundColor: Colors.transparent,
    //  // ),
  );
}

Widget text() {
  return Center(
    child: Text(
      "TopNotch Solutions\u2122 2019",
      style: TextStyle(
          fontSize: 20, color: Colors.black, fontStyle: FontStyle.normal),
    ),
  );
}



class _SplashScreenState extends State<SplashScreen> {
  String email;
  String password;
  String token;
  int id;
  String userType;

  /// NEW CODE.
  @override
  void initState() {
    super.initState();

    /// Initialize data, then navigator to Home screen.
    initData().then((value) {
      print('val' + value.toString());
      print(token);
      navigateToHomeScreen();
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      color: Colors.white,
      child: Column(
        // child: FlutterLogo(size: 200),
        children: <Widget>[
          SizedBox(
            height: 175,
          ),
          logo(),
          SizedBox(
            height: 200,
          ),
          text(),
        ],
      ),
    ));
  }

  /// NEW CODE.
  /// We can do long run task here.
  /// In this example, we just simply delay 3 seconds, nothing complicated.
  Future<bool> initData() async {
    bool done;
    await Future.delayed(Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
    id = prefs.getInt('id');
    print(id);
    token = prefs.getString('token');
    print('splashScreen');
    print(token);
    userType = prefs.getString('userType');
    print(userType);
    email = prefs.getString('email');
    print(email);
    done = true;
    return done;
  }

  /// NEW CODE.
  /// Navigate to Home screen.
  void navigateToHomeScreen() {
    /// Push home screen and replace (close/exit) splash screen.
    // _read();
    print('in nav');
    print(token);
    if (token != null && userType == "Developer") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DevHomePage()));
      //Navigator.pushReplacementNamed(context, '/dhome');
    } else if (token != null && userType == 'Client') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));

      ///Navigator.pushReplacementNamed(context, '/home');
    } else if (token == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => App()));
    }
  }
}
