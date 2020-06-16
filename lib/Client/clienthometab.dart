import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:udevs/Client/SelectedProfiles/blockdev.dart';
import 'package:udevs/Client/SelectedProfiles/datadev.dart';
import 'package:udevs/Client/SelectedProfiles/digidev.dart';
import 'package:udevs/Client/SelectedProfiles/machdev.dart';
import 'package:udevs/Client/SelectedProfiles/mobdev.dart';
import 'package:udevs/Client/SelectedProfiles/multidev.dart';
import 'package:udevs/Client/SelectedProfiles/natdev.dart';
import 'package:udevs/Client/SelectedProfiles/robodev.dart';
import 'package:udevs/Client/SelectedProfiles/softdev.dart';
import 'package:udevs/Client/SelectedProfiles/webdev.dart';
import 'package:udevs/Client/myProjects.dart';
import 'package:udevs/Developer/AllDevProfiles/blockdevs.dart';
import 'package:udevs/Developer/AllDevProfiles/datadevs.dart';
import 'package:udevs/Developer/AllDevProfiles/digidevs.dart';
import 'package:udevs/Developer/AllDevProfiles/machdevs.dart';
import 'package:udevs/Developer/AllDevProfiles/mobdevs.dart';
import 'package:udevs/Developer/AllDevProfiles/multidevs.dart';
import 'package:udevs/Developer/AllDevProfiles/natdevs.dart';
import 'package:udevs/Developer/AllDevProfiles/robodevs.dart';
import 'package:udevs/Developer/AllDevProfiles/softdevs.dart';
import 'package:udevs/Developer/AllDevProfiles/webdevs.dart';
//import 'package:flutter_web_view/flutter_web_view.dart';
//import 'package:udevs/Developer/myProjects.dart';
import 'package:udevs/Client/clienthome.dart';
import 'package:udevs/Client/postProjects.dart';
import 'package:udevs/models/user.dart';

class ClientHomeScreen extends StatefulWidget {
  @override
  _ClientHomeScreenState createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen>
    with TickerProviderStateMixin {
  final String url1 = "http://192.168.1.8:3000/users/cli_home/webDeveloper";
  final String url2 = "http://192.168.1.8:3000/users/cli_home/mobDeveloper";
  final String url3 = "http://192.168.1.8:3000/users/cli_home/dataDeveloper";
  final String url4 = "http://192.168.1.8:3000/users/cli_home/softDeveloper";
  final String url5 = "http://192.168.1.8:3000/users/cli_home/blockDeveloper";
  final String url6 = "http://192.168.1.8:3000/users/cli_home/machineDeveloper";
  final String url7 = "http://192.168.1.8:3000/users/cli_home/langDeveloper";
  final String url8 ="http://192.168.1.8:3000/users/cli_home/digiMarkDeveloper";
  final String url9 = "http://192.168.1.8:3000/users/cli_home/multiDeveloper";
  final String url10 = "http://192.168.1.8:3000/users/cli_home/robotDeveloper";

  Future<List<User>> _fetchWebProjects() async {
    var data = await http.get(url1);
    var jsonData = json.decode(data.body);
    print(data.body);
    print("web list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
          p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchMobileProjects() async {
    var data = await http.get(url2);
    var jsonData = json.decode(data.body);
    print("mobile list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchDataProjects() async {
    var data = await http.get(url3);
    var jsonData = json.decode(data.body);
    print("data list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
         p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchSoftwareProjects() async {
    var data = await http.get(url4);
    var jsonData = json.decode(data.body);
    print("software list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchBlockProjects() async {
    var data = await http.get(url5);
    var jsonData = json.decode(data.body);
    print("block chain list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchMachineProjects() async {
    var data = await http.get(url6);
    var jsonData = json.decode(data.body);
    print("machine list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchNaturalProjects() async {
    var data = await http.get(url7);
    var jsonData = json.decode(data.body);
    print("natural list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchDigitalProjects() async {
    var data = await http.get(url8);
    var jsonData = json.decode(data.body);
    print("digital list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchMultimediaProjects() async {
    var data = await http.get(url9);
    var jsonData = json.decode(data.body);
    print("multimedia list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<User>> _fetchRoboticsProjects() async {
    var data = await http.get(url10);
    var jsonData = json.decode(data.body);
    print("robo list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Widget _webtext() {
    return new Center(
      child: Text(
        "Web development",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _mobiletext() {
    return new Center(
      child: Text(
        "Mobile development",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _datasciencetext() {
    return new Center(
      child: Text(
        "Data science",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _softwaretext() {
    return new Center(
      child: Text(
        "Software development",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _machinetext() {
    return new Center(
      child: Text(
        "Machine learning",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _blocktext() {
    return new Center(
      child: Text(
        "Block chain",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _naturaltext() {
    return new Center(
      child: Text(
        "Natural language processing",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _digitaltext() {
    return new Center(
      child: Text(
        "Digital marketing",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _multimediatext() {
    return new Center(
      child: Text(
        "Multimedia designing",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _roboticstext() {
    return new Center(
      child: Text(
        "Robotics",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget newProjectButton() {
    return ButtonTheme(
        height: 50.0,
        child: RaisedButton(
          // shape: new Border.all(color: Colors.black, width: 1.5),
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
            //mainAxisSize: MainAxisSize.max,
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

  double rating = 3;
  int starCount = 5;
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.0),
                  topRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70.0),
                  bottomRight: Radius.circular(70.0))),
          padding: EdgeInsets.all(3),
          child: SingleChildScrollView(
            child: Container(
              width: targetWidth,
              height: deviceHeight * 3.8,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Row(children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        shape: new Border.all(color: Colors.black),
                        elevation: 10.0,
                        color: Colors.blueGrey[600],
                        child: Text(
                          "Top Developers",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        shape: new Border.all(color: Colors.black),
                        elevation: 10.0,
                        color: Colors.blueGrey[600],
                        child: Text(
                          "My projects",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClientProjectScreen()));
                        },
                      ),
                    ),
                  ]),
                  SizedBox(height: 10.0),
                  newProjectButton(),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _webtext(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchWebProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("web");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("No developers yet!"),
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
                                        Webdev(snapshot.data[id])),
                              );
                            },
                            child: SizedBox(
                              width: deviceWidth / 2,
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new CircleAvatar(
                                          radius: 35,
                                          backgroundImage: NetworkImage(
                                              //snapshot.data[id].imagename
                                              "http://192.168.1.8:3000/default.png"),
                                        ),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new Text(
                                          snapshot.data[id].firstname +
                                              " " +
                                              snapshot.data[id].lastname,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
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
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _mobiletext(),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MobDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchMobileProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("mob");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                                          Mobdev(snapshot.data[id])),
                                );
                              },
                              child: SizedBox(
                                width: deviceWidth / 2,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                //  snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                     
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _datasciencetext(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DataDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchDataProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("rrrrr");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("No developers yet!"),
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
                          return SizedBox(
                            width: deviceWidth / 2,
                            child: Card(
                              elevation: 5,
                              //color: Colors.green[200],
                              child: new InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Datadev(snapshot.data[id])),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                // snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _softwaretext(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SoftDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchSoftwareProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("rrrrr");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                          return SizedBox(
                            width: deviceWidth / 2,
                            child: Card(
                              elevation: 5,
                              //color: Colors.brown[200],
                              child: new InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Softdev(snapshot.data[id])));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                // snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _blocktext(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlockDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Center(
                                  child: Text(
                                    '  See All',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchBlockProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("other");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                          return SizedBox(
                            width: deviceWidth / 2,
                            child: Card(
                              elevation: 5,
                              // color: Colors.pink[200],
                              child: new InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Blockdev(snapshot.data[id])));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                // snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      ));
                      //);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _machinetext(),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MachDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchMachineProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("machine");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                                          Machdev(snapshot.data[id])),
                                );
                              },
                              child: SizedBox(
                                width: deviceWidth / 2,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                //  snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _naturaltext(),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NatDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchNaturalProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("natural");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                                          Natdev(snapshot.data[id])),
                                );
                              },
                              child: SizedBox(
                                width: deviceWidth / 2,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                //  snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _digitaltext(),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DigiDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchDigitalProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("digital");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                               SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                                          Digidev(snapshot.data[id])),
                                );
                              },
                              child: SizedBox(
                                width: deviceWidth / 2,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                //  snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _multimediatext(),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MultiDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchMultimediaProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("multimedia");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                               SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                                          Multidev(snapshot.data[id])),
                                );
                              },
                              child: SizedBox(
                                width: deviceWidth / 2,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                //  snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  _roboticstext(),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                          height: 30,
                          width: 70,
                          child: RaisedButton(
                            elevation: 5,
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RoboDevelopers()),
                              );
                            },
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                //new Text('Button with text and icon!'),
                                //new Icon(Icons.money_off),
                                Text(
                                  '  See All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                  FutureBuilder(
                    future: _fetchRoboticsProjects(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      print("robotics");
                      if (snapshot?.data?.isEmpty??true) {
                        return Container(
                          height: 150,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                SizedBox(height: 30,),
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 25,
                                ),
                                Text("No developers yet!"),
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
                                          Robodev(snapshot.data[id])),
                                );
                              },
                              child: SizedBox(
                                width: deviceWidth / 2,
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                //  snapshot.data[id].imagename
                                                "http://192.168.1.8:3000/default.png"),
                                          ),
                                        ),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                     Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Center(
                                        child: new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
