import 'package:flutter/material.dart';
//import 'package:path/path.dart';
//import 'package:flutter/services.dart';
import 'package:udevs/Client/createAccount.dart';
import 'package:udevs/Developer/devRegiter.dart';

class UserTypePage extends StatefulWidget {
  @override
  _UserTypePageState createState() => new _UserTypePageState();
}

class _UserTypePageState extends State<UserTypePage> {
  //int _bottomNavIndex=0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   elevation: 0.0,
      //   title: Text('What do you want from us?'),
      //   centerTitle: true,
      //   // iconTheme: new IconThemeData(color: Color(0xFF18D191)
      //   // )
      // ),
      body: Container(
        //decoration: BoxDecoration(image: _backgroundImage()),
         decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.deepPurple[300], Colors.black],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Container(
            // width: targetWidth,
            child: Form(
              //  key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    // padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    children: <Widget>[
                      Container(
                        color: Colors.pink,
                        child: SizedBox(
                          height: 40,
                          child: Center(
                            child: Text(
                              'Pick one!',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),)
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 50.0, right: 50.0, top: 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CreateAccountPage(),
                                      ));
                                },
                                child: new Container(
                                    alignment: Alignment.center,
                                    height: 40.0,
                                    decoration: new BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius:
                                            new BorderRadius.circular(9.0)),
                                    //child:new Icon(Icons.lightbulb_outline),
                                    child: new Text("I want to hire...",
                                        style: new TextStyle(
                                            fontSize: 19.0,
                                            color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 50.0, right: 50.0, top: 0.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DevRegisterPage(),
                                      ));
                                },
                                child: new Container(
                                    alignment: Alignment.center,
                                    height: 40.0,
                                    decoration: new BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius:
                                            new BorderRadius.circular(9.0)),
                                    //child:new Icon(Icons.lightbulb_outline),
                                    child: new Text("I want to work...",
                                        style: new TextStyle(
                                            fontSize: 19.0,
                                            color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  
}
