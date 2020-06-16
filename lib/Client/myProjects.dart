import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Client/MyProjects/ConfirmProjects/confirm.dart';
import 'package:udevs/Client/MyProjects/CurrentProjects/current.dart';
import 'package:udevs/Client/MyProjects/FinishedProjects/finish.dart';
import 'package:udevs/Client/postProjects.dart';

class ClientProjectScreen extends StatefulWidget {
  @override
  _ClientProjectScreenState createState() => _ClientProjectScreenState();
}

class _ClientProjectScreenState extends State<ClientProjectScreen>
    with TickerProviderStateMixin {
  final String url = "http://192.168.1.8:3000/users/viewAllCurrentProject";
  final String url1 = "http://192.168.1.8:3000/users/viewAllConfirmedProject";
  final String url2 = "http://192.168.1.8:3000/users/viewAllCompletedProject";

  Widget newProjectButton() {
    return ButtonTheme(
        height: 50.0,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.indigo,
          elevation: 20.0,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClientPostProjectscreen()),
            );
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //new Text('Button with text and icon!'),
              new Icon(Icons.add_circle),
              Text(
                '  Post New Project',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ));
  }

  Widget _currentprojects() {
    return Container(
      height: 56,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
            future: _fetchcurr(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              print("web");
              if (snapshot?.data?.isEmpty ?? true) {
                return Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("No projects yet!"),
                      ],
                    ),
                  ),
                );
              }

              return new Expanded(
                  child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Current(snapshot.data[id])),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                "Name: " + snapshot.data[id].projectname,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        //  ),
                        //color: Colors.blue[50],
                      ),
                    ),
                  );
                },
              ));
              //);
            },
          ),
        ],
      ),
      width: 400,
    );
  }

  Widget _confirmedprojects() {
    return Container(
      height: 56,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
            future: _fetchcon(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              print("web");
              if (snapshot?.data?.isEmpty ?? true) {
                return Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("No projects yet!"),
                      ],
                    ),
                  ),
                );
              }

              return new Expanded(
                  child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Confirm(snapshot.data[id])),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                "Name: " + snapshot.data[id].projectname,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        //  ),
                        //color: Colors.blue[50],
                      ),
                    ),
                  );
                },
              ));
              //);
            },
          ),
        ],
      ),
      width: 400,
    );
  }

  Widget _finishedprojects() {
    return Container(
      height: 56,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          FutureBuilder(
            future: _fetchfin(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              print("web");
              if (snapshot?.data?.isEmpty ?? true) {
                return Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                       
                        Text("No projects yet!"),
                      ],
                    ),
                  ),
                );
              }

              return new Expanded(
                  child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Finish(snapshot.data[id])),
                      );
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 2,
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                "Name: " + snapshot.data[id].projectname,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        //  ),
                        //color: Colors.blue[50],
                      ),
                    ),
                  );
                },
              ));
              //);
            },
          ),
        ],
      ),
      width: 400,
    );
  }

  Future<List<Project>> _fetchcurr() async {
    print('fetching current');
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);
    var data = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: token},
    );
    var jsonData = json.decode(data.body);
    print("+++++++++++++++");
    print(jsonData);
    List<Project> techs = [];
    for (var d in jsonData) {
      Project tech = Project(d["id"], d["project_name"], d["project_category"],
          d["project_description"], d["payment"], d['createdAt']);

      techs.add(tech);
    }
    print("-----------------------");
    print(techs.length);
    return techs;
  }

  Future<List<Project>> _fetchcon() async {
    print('fetching confirm');
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);
    var data = await http.get(
      url1,
      headers: {HttpHeaders.authorizationHeader: token},
    );
    var jsonData = json.decode(data.body);
    print("+++++++++++++++");
    print(jsonData);
    List<Project> techs = [];
    for (var d in jsonData) {
      Project tech = Project(
          d["id"],
          d['project']["project_name"],
          d['project']["project_category"],
          d['project']["project_description"],
          d['project']["payment"],
          d['project']['createdAt']);

      techs.add(tech);
    }
    print("-----------------------");
    print(techs.length);
    return techs;
  }

  Future<List<Project>> _fetchfin() async {
    print('fetching finish');
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);
    var data = await http.get(
      url2,
      headers: {HttpHeaders.authorizationHeader: token},
    );
    var jsonData = json.decode(data.body);
    print("finisssssssssssssssssssssss");
    print(jsonData);
    List<Project> techs = [];
    for (var d in jsonData) {
      Project tech = Project(d['project']["id"], d['project']["project_name"], d['project']["project_category"],
          d['project']["project_description"], d['project']["payment"], d['project']['createdAt']);

      techs.add(tech);
    }
    print("-----------------------");
    print(techs.length);
    return techs;
  }

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
                  newProjectButton(),
                  SizedBox(height: 30.0),
                  Text(
                    '  Current projects',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  _currentprojects(),
                  SizedBox(height: 15.0),
                  Divider(),
                  Text(
                    '  Confirm projects',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  _confirmedprojects(),
                  SizedBox(height: 15.0),
                  Divider(),
                  Text(
                    '  Finished projects',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  _finishedprojects(),
                ],
              ))),
    );
  }
}

class Project {
  int id;
  String projectname;
  String projectcategory;
  String projectdescription;
  String payment;
  String createdAt;
  Project(
    this.id,
    this.projectname,
    this.projectcategory,
    this.projectdescription,
    this.payment,
    this.createdAt,
  );

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
}
