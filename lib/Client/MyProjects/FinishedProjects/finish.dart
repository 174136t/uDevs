import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
//import 'package:udevs/Projects/webpro.dart';
//import 'package:udevs/splash.dart';
//import 'package:udevs/Developer/devhometab.dart';
//import 'package:udevs/models/projects.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udevs/Client/myProjects.dart';

class Finish extends StatefulWidget {
  final Project project;

  Finish(this.project);
  @override
  _FinishState createState() => _FinishState();
}

class _FinishState extends State<Finish> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String bid = '';
  bool loading = false;
  final String url1 = "http://192.168.1.8:3000/users/project/viewProReq";

  void _fetchbidval() async {
    var url = 'http://192.168.1.8:3000/users/project/viewBid';
    int proid = widget.project.id;
    var body = {'project_ID': '$proid'};
    var data = await http.post(url, body: body);
    var jsonData = json.decode(data.body);
    // print("bidddddddddddddddddddddddddddddd");
    // print(jsonData);
    bid = jsonData['maximum_value'];
    // print(bid);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    setState(() {
      loading = true;
      _fetchbidval();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('uDevs'),
        centerTitle: true,
      ),
      body: Container(
        decoration: new BoxDecoration(
            color: Colors.deepPurple[100],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(120.0),
                topRight: Radius.circular(120),
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0))),
        child: SingleChildScrollView(
          child: Container(
            width: targetWidth,
            height: deviceHeight * 2,
            child: new Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'About project ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                    decoration: new BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    width: deviceWidth * 0.98,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          color: Colors.deepPurple[50],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: deviceWidth * 0.96,
                              child: new Column(
                                children: <Widget>[
                                  Text(
                                    'Project Name: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    widget.project.projectname,
                                    style: TextStyle(
                                      color: Colors.black,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        new Card(
                          color: Colors.deepPurple[50],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: deviceWidth * 0.96,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Project Category: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    widget.project.projectcategory,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        new Card(
                          color: Colors.deepPurple[50],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: deviceWidth * 0.96,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Project Description: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    widget.project.projectdescription,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Card(
                              color: Colors.deepPurple[50],
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: deviceWidth * 0.42,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Payment: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        widget.project.payment.isEmpty
                                            ? '0' + " \$"
                                            : widget.project.payment + " \$",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            new Card(
                              color: Colors.deepPurple[50],
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: deviceWidth * 0.42,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'Max bid: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        widget.project.payment.isNotEmpty
                                            ? '0' + " \$"
                                            : bid + " \$",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new Card(
                          color: Colors.deepPurple[50],
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.deepPurple[50],
                              width: deviceWidth * 0.96,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Created at: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    widget.project.createdAt,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                         
                  Divider(),
                   SizedBox(
                  height: 20,
                ),
                  Text(
                    'Completed by:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Fix {
  int id;
  int clientid;
  String firstname;
  String lastname;
  int rating;
  Fix(this.id, this.clientid, this.firstname, this.lastname, this.rating);

  // Fix.fromMap(Map<String, dynamic> map) {
  //   this.clientid = map['skill'];
  // }
}
