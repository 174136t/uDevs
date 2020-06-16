import 'package:flutter/material.dart';

class ClientMsgScreen extends StatefulWidget {
  @override
  _ClientMsgScreenState createState() => _ClientMsgScreenState();
}

class _ClientMsgScreenState extends State<ClientMsgScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body:Container( 
        decoration: new BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(230.0))),
      child:SingleChildScrollView(

        child:Container(
           width: targetWidth,
          height: deviceHeight ,
          
          child: Center(
            child:new Text('chats'),
        ),
      ),),),
    );
  }
}