import 'package:flutter/material.dart';
//import 'package:flutter_web_view/flutter_web_view.dart';

class DevNotifyScreen extends StatefulWidget {
  @override
  _DevNotifyScreenState createState() => _DevNotifyScreenState();
}

class _DevNotifyScreenState extends State<DevNotifyScreen> {

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(

        child:Container(
           width: targetWidth,
          height: deviceHeight ,
          decoration: new BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(230.0))),
          child: Center(
            child:new Text('notifications'),
        ),
      ),),
    );
  }
}
