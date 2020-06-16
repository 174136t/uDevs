import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:udevs/star.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
//import 'package:flutter_web_view/flutter_web_view.dart';

class ClientNotifyScreen extends StatefulWidget {
  @override
  _ClientNotifyScreenState createState() => _ClientNotifyScreenState();
}
class _ClientNotifyScreenState extends State<ClientNotifyScreen> {
 double rating = 3.5;
  int starCount = 5;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: new BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(230.0))),
        child: SingleChildScrollView(
          child: Container(
            width: targetWidth,
            height: deviceHeight,
            child: Center(
              child:Text('Notifications'),
            ),
          ),
        ),
      ),
    );
  }
}
