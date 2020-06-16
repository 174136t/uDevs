import 'package:flutter/material.dart';
import 'package:udevs/Client/clienthome.dart';
import 'package:udevs/Developer/devloperhome.dart';
import 'package:udevs/login_screen.dart';
import 'package:udevs/Client/createAccount.dart';
import 'package:udevs/Client/clientProfilePic.dart';
//import 'package:udevs/webpage.dart';
import 'usertype.dart';
import 'splash.dart';

//import 'package:simple_auth_flutter/simple_auth_flutter.dart';

void main() => runApp(TopNotch());
DateTime currentBackPressTime= DateTime.now();
class TopNotch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TopNotch',
      debugShowCheckedModeBanner: false,

      theme: ThemeData( 
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrange,
          buttonColor: Colors.deepPurple,
          fontFamily: 'Manjari'),
      routes: {
        '/home': (BuildContext context) => HomePage(),
        '/dhome':(BuildContext context) => DevHomePage(),
        '/login': (BuildContext context) => LoginScreen(),
        '/account': (BuildContext context) => CreateAccountPage(),
        '/cpp':(BuildContext context) =>ClientPP(),
        '/user':(BuildContext context) => UserTypePage(),
       // '/webpage': (BuildContext context) => WebPage(),

      },
      home: SplashScreen(),
    );
    
  }
}

