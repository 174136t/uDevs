import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
//import 'package:udevs/Projects/webpro.dart';
//import 'package:udevs/splash.dart';
//import 'package:udevs/Developer/devhometab.dart';
//import 'package:udevs/models/projects.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Client/myProjects.dart';

class Fixcon extends StatefulWidget {
  @override
  _FixconState createState() => _FixconState();
}

class _FixconState extends State<Fixcon> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String bid = '';
  bool loading = false;
  final String url1 = "http://192.168.1.8:3000/users/project/viewProReq";
  final String url2 = "http://192.168.1.8:3000/users/devPro/fix_con_pro";
  final String url3 = "http://192.168.1.8:3000/users/project/viewReqDev";

  Future<List<Fix>> _fetchfix() async {
    print('fetching skills');
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);
    var data = await http.get(
      url2,
      headers: {HttpHeaders.authorizationHeader: token},
    );
    var jsonData = json.decode(data.body);
    print("+++++++++++++++");
    print(jsonData);
    List<Fix> techs = [];
    for (var d in jsonData) {
      Fix tech = Fix(
        d["id"],
        d["developer_ID"],
        d['project']['project_name'],
        d['project']['project_category'],
        d['project']['payment'],
      );
      techs.add(tech);
    }
    print("-----------------------");
    print(techs.length);
    return techs;
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
                  'Fix confirm projects ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  //elevation: 5,
                  height: 100,
                  //color: Colors.deepPurple[50],
                  child: Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: _fetchfix(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          // print(snapshot.data);
                          // print("fix avooooo");
                          if (snapshot?.data?.isEmpty ?? true) {
                            return Container(
                              //height: 10,
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 25,
                                    ),
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("No fix confirm projects!"),
                                  ],
                                ),
                              ),
                            );
                          }

                          return Expanded(
                            child: new ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int id) {
                                return SizedBox(
                                  //height: 500,
                                  width: deviceWidth / 2,
                                  child: Card(
                                    color: Colors.deepPurple[50],
                                    elevation: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                            child: Text(
                                          'Name:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )),
                                        Center(
                                          child: new Text(
                                            snapshot.data[id].projectname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Center(
                                            child: Text(
                                          'Payment:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )),
                                        Center(
                                            child: Text(
                                          snapshot.data[id].payment+" \$",
                                          style: TextStyle(
                                            color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )),
                                      ],
                                    ),
                                    //  ),
                                    //color: Colors.blue[50],
                                  ),
                                );
                              },
                            ),
                          );
                          //);
                        },
                      ),
                    ],
                  ),
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
  int devid;
  String projectname;
  String category;
  String payment;

  Fix(this.id, this.devid, this.projectname, this.category, this.payment);

  // Fix.fromMap(Map<String, dynamic> map) {
  //   this.clientid = map['skill'];
  // }
}
