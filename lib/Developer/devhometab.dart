import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udevs/Developer/MyPro/mypro.dart';
import 'package:udevs/Developer/devloperhome.dart';
import 'package:udevs/Projects/SelectedProjects/block.dart';
import 'package:udevs/Projects/SelectedProjects/data.dart';
import 'package:udevs/Projects/SelectedProjects/digital.dart';
import 'package:udevs/Projects/SelectedProjects/machine.dart';
import 'package:udevs/Projects/SelectedProjects/mob.dart';
import 'package:udevs/Projects/SelectedProjects/multy.dart';
import 'package:udevs/Projects/SelectedProjects/natural.dart';
import 'package:udevs/Projects/SelectedProjects/robo.dart';
import 'package:udevs/Projects/SelectedProjects/web.dart';
import 'package:udevs/Projects/SelectedProjects/soft.dart';
import 'package:udevs/Projects/blockPro.dart';

import 'package:udevs/Projects/datapro.dart';
import 'package:udevs/Projects/digitalPro.dart';
import 'package:udevs/Projects/machinePro.dart';
import 'package:udevs/Projects/mobilePro.dart';
import 'package:udevs/Projects/multyPro.dart';
import 'package:udevs/Projects/naturalPro.dart';
import 'package:udevs/Projects/roboPro.dart';
import 'package:udevs/Projects/softPro.dart';
//import 'devhomeviewprojects.dart';
import 'dart:async';

import 'package:udevs/Projects/webpro.dart';
import 'package:udevs/models/projects.dart';

class DevHomeScreen extends StatefulWidget {
 
  @override
  _DevHomeScreenState createState() => _DevHomeScreenState();
}
 
class _DevHomeScreenState extends State<DevHomeScreen> {
  //bool loading = false;
   static final  hostUrl="http://192.168.1.8:3000/users";
  final String url1 = "$hostUrl/dev_home/webProject";
  final String url2 = "$hostUrl/dev_home/mobProject";
  final String url3 = "$hostUrl/dev_home/dataProject";
  final String url4 = "$hostUrl/dev_home/softProject";
  final String url5 = "$hostUrl/dev_home/blockchain";
  final String url6 = "$hostUrl/dev_home/machlearn";
  final String url7 = "$hostUrl/dev_home/natlang";
  final String url8 = "$hostUrl/dev_home/digimark";
  final String url9 = "$hostUrl/dev_home/multiDesign";
  final String url10 = "$hostUrl/dev_home/robot";

  Future<List<Project>> _fetchWebProjects() async {
    var data = await http.get(url1);
    var jsonData = json.decode(data.body);
    print(data.body);
    print("web list");
    print('oooooooooooooooooooooooooo');
    print(url1);
    //  setState(() {
    //     loading = false;
    //   });
    List<Project> projects = [];
    for (var p in jsonData) {
      Project project = Project(
          p["id"],
          p["project_name"],
          p["project_category"],
          p["project_description"],
          p["user"]["first_name"],
          p["user"]['last_name'],
          p["payment"],
          // p["period"],
           p["user"]["profile_img"],
          p['createdAt'],
          p['user']['createdAt'],
          p['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchMobileProjects() async {
    var data = await http.get(url2);
    var jsonData = json.decode(data.body);
    print("mobile list");
    print('oooooooooooooooooooooooooo');
    print(url1);
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchDataProjects() async {
    var data = await http.get(url3);
    var jsonData = json.decode(data.body);
    print("data list");
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchSoftwareProjects() async {
    var data = await http.get(url4);
    var jsonData = json.decode(data.body);
    print("software list");
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchBlockProjects() async {
    var data = await http.get(url5);
    var jsonData = json.decode(data.body);
    print("block chain list");
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchMachineProjects() async {
    var data = await http.get(url6);
    var jsonData = json.decode(data.body);
    print("machine list");
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchNaturalProjects() async {
    var data = await http.get(url7);
    var jsonData = json.decode(data.body);
    print("natural list");
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchDigitalProjects() async {
    var data = await http.get(url8);
    var jsonData = json.decode(data.body);
    print("digital list");
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchMultimediaProjects() async {
    var data = await http.get(url9);
    var jsonData = json.decode(data.body);
    print("multimedia list");
    List<Project> projects = [];
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }

  Future<List<Project>> _fetchRoboticsProjects() async {
    var data = await http.get(url10);
    var jsonData = json.decode(data.body);
    print("robo list");
    List<Project> projects = [];
    print("&&&&&&&&&&&&77");
    print(projects);
    for (var d in jsonData) {
      Project project = Project(
          d["id"],
          d["project_name"],
          d["project_category"],
          d["project_description"],
          d["user"]["first_name"],
          d["user"]['last_name'],
          d["payment"],
          // d["period"],
           d["user"]["profile_img"],
          d['createdAt'],
          d['user']['createdAt'],
          d['user']['rating']);
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
  

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(120.0),
                topRight: Radius.circular(120),
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0))),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: targetWidth,
            height: deviceHeight * 3.8,

            // child: SingleChildScrollView(
            //child: Container(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Row(children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: new Border.all(color: Colors.black),
                      elevation: 10.0,
                      color: Colors.blueGrey[600],
                      //  highlightColor: Colors.blue,
                      child: Text(
                        "Projects",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DevHomePage()));
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
                      onPressed:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DevProjects()));
                        },
                    ),
                  ),
                ]),
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
                                  builder: (context) => Webproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                                      Webpro(snapshot.data[id])),
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
                                    child: new CircleAvatar(
                                      radius: 35,
                                      backgroundImage: NetworkImage(
                                          //snapshot.data[id].imagename
                                          "http://192.168.1.8:3000/default.png"),
                                    ),
                                  ),
                                  new SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: new Text(
                                      snapshot.data[id].projectname,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: new Text(
                                      "by " +
                                          snapshot.data[id].clientfirstname +
                                          " " +
                                          snapshot.data[id].clientlastname,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: new Text(
                                      snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.red[600]),
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
                                  builder: (context) => Mobileproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                        Mobpro(snapshot.data[id])),
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
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            //  snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Dataproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                            Datapro(snapshot.data[id])),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            // snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Softwareproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                              Softpro(snapshot.data[id])));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            // snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Blockproject()),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                              Blockpro(snapshot.data[id])));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            // snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Machineproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                        Machinepro(snapshot.data[id])),
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
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            //  snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Naturalproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                        Naturalpro(snapshot.data[id])),
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
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            //  snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Digitalproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                        Digitalpro(snapshot.data[id])),
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
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            //  snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Multyproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                        Multypro(snapshot.data[id])),
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
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            //  snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
                                  builder: (context) => Roboproject()),
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
                                    fontSize: 12, fontWeight: FontWeight.bold),
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
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(
                                height: 5,
                              ),
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
                                        Robopro(snapshot.data[id])),
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
                                      child: new CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            //  snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                    ),
                                    new SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: new Text(
                                        snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[600]),
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
              ],
              //)
            ),
            // )
          ),
        ),
      ),
    );
  }
}
