import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:udevs/Developer/MyPro/BidPro/complete.dart';
import 'package:udevs/Developer/MyPro/BidPro/confirm.dart';
import 'package:udevs/Developer/MyPro/BidPro/current.dart';
import 'package:udevs/Developer/MyPro/CliReqPro/complete.dart';
import 'package:udevs/Developer/MyPro/CliReqPro/confirm.dart';
import 'package:udevs/Developer/MyPro/CliReqPro/current.dart';
import 'package:udevs/Developer/MyPro/FixPro/complete.dart';
import 'package:udevs/Developer/MyPro/FixPro/confirm.dart';
import 'package:udevs/Developer/MyPro/FixPro/current.dart';

class DevProjects extends StatefulWidget {
  @override
  _DevProjectsState createState() => _DevProjectsState();
}

class _DevProjectsState extends State<DevProjects>
    with TickerProviderStateMixin {
  final String url = "http://192.168.1.8:3000/users/viewAllCurrentProject";
  final String url1 = "http://192.168.1.8:3000/users/viewAllConfirmedProject";
  final String url2 = "http://192.168.1.8:3000/users/viewAllCompletedProject";

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.height;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.98;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Projects'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: new Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [const Color(0xFFD1C4E9), const Color(0xFFB2DFDB)],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),
              height: deviceHeight,
              width: targetWidth,
              child: new Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  //newProjectButton(),

                  Text(
                    'Fixed projects',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.amber[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Fixcur()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Current Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.teal[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Fixcon()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Confirmed Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Fixcom()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Completed Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //_currentprojects(),
                  SizedBox(height: 5.0),
                  Divider(),
                  Text(
                    'Bid projects',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.amber[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Bidcur()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Current Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.teal[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Bidcon()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Confirmed Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Bidcom()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Completed Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // _confirmedprojects(),
                  SizedBox(height: 5.0),
                  Divider(),
                  Text(
                    'Client requested projects',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                 Container(
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.amber[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Clicur()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Current Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.teal[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Clicon()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Confirmed Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          //width: 140,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            //padding: const EdgeInsets.symmetric(horizontal: 40),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Clicom()),
                              );
                            },
                            child: new Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                               
                                Center(
                                  child: Text(
                                    'Completed Projects',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //_finishedprojects(),
                ],
              ))),
    );
  }
}

// class Project {
//   int id;
//   String projectname;
//   String projectcategory;
//   String projectdescription;
//   String payment;
//   String createdAt;
//   Project(
//     this.id,
//     this.projectname,
//     this.projectcategory,
//     this.projectdescription,
//     this.payment,
//     this.createdAt,
//   );

//     Project.fromMap(Map<String, dynamic> map) {
//   this.id = map['project']["id"];
//   this.projectname = map['project']["project_name"];
//   this.projectcategory = map['project']["project_category"];
//   this.projectdescription = map['project']["project_description"];
//   // this.clientfirstname = map["user"]["first_name"];
//   // this.clientlastname = ["user"]['last_name'];
//   this.payment = map['project']["payment"];
//   this.createdAt = map['project']["createdAt"];

// }
