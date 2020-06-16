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

class Current extends StatefulWidget {
  final Project project;

  Current(this.project);
  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String bid='';
bool loading = false;
  final String url1 = "http://192.168.1.8:3000/users/project/viewProReq";
  final String url2 = "http://192.168.1.8:3000/users/project/viewBidReq";
  final String url3 = "http://192.168.1.8:3000/users/project/viewReqDev";

  Future<List<Fix>> _fetchfix() async {
    //_fetchbidval();
    //print('fetching Tech');
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id');
    int proid = widget.project.id;
    var body = {
      'id': '$proid',
      'client_ID': "$id",
    };
    var data = await http.post(url1, body: body);
    var jsonData = json.decode(data.body);
    //print(jsonData);
    List<Fix> techs = [];
    for (var d in jsonData) {
      Fix tech = Fix(d["id"], d["developer_ID"], d['user']['first_name'],
          d['user']['last_name'], d['user']['rating'],d['bid_value']);
      techs.add(tech);
    }
    //print("11111111111");
    // print(techs.length);
    return techs;
  }
Future<List<Fix>> _fetchbid() async {
    //print('fetching bid');
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id');
    int proid = widget.project.id;
    var body = {
      'id': '$proid',
      'client_ID': "$id",
    };
    var data = await http.post(url2, body: body);
    var jsonData = json.decode(data.body);
    print('55555555555555');
     print(jsonData);
    List<Fix> techs = [];
    for (var d in jsonData) {
      Fix tech = Fix(d["id"], d["developer_ID"], d['user']['first_name'],
          d['user']['last_name'], d['user']['rating'],d['bid_value']);
      techs.add(tech);
    }
    // print("11111111111");
    // print(techs.length);
    return techs;
  }
  Future<List<Fix>> _fetchdir() async {
    // print('fetching bid');
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id');
    int proid = widget.project.id;
    var body = {
      'id': '$proid',
      'client_ID': "$id",
    };
    var data = await http.post(url3, body: body);
    var jsonData = json.decode(data.body);
    // print(jsonData);
    List<Fix> techs = [];
    for (var d in jsonData) {
      Fix tech = Fix(d["id"], d["developer_ID"], d['user']['first_name'],
          d['user']['last_name'], d['user']['rating'],d['bid_value']);
      techs.add(tech);
    }
    // print("222222222222");
    // print(techs.length);
    return techs;
  }
  void _fetchbidval()async{
    var url='http://192.168.1.8:3000/users/project/viewBid';
     int proid = widget.project.id;
    var body={
      'project_ID':'$proid' 
    };
    var data = await http.post(url, body: body);
    var jsonData = json.decode(data.body);
    // print("bidddddddddddddddddddddddddddddd");
    // print(jsonData);
      bid=jsonData['maximum_value'];
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
    });    super.initState();
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
                                        widget.project.payment.isEmpty?'0' + " \$":widget.project.payment+" \$",
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
                                        widget.project.payment.isNotEmpty?'0' + " \$": bid+ " \$",
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
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Fixed Requests",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  //elevation: 5,
                  height: 160,
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
                                    Text("No fix requests!"),
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
                                          height: 2,
                                        ),
                                        Center(
                                            child: Text(
                                          'From:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )),
                                        Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                            'Star rating:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          )),
                                        ),
                                        Center(
                                          child: new StarRating(
                                            size: 25.0,
                                            rating: (snapshot.data[id].rating)
                                                .toDouble(),
                                            color: Colors.deepPurple,
                                            borderColor: Colors.deepPurple,
                                            starCount: 5,
                                            onRatingChanged: (rating) =>
                                                setState(
                                              () {
                                                //this.rating = rating;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // width: deviceWidth*,
                                          child: RaisedButton(
                                            color: Colors.indigo,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40),
                                            textColor: Colors.white,
                                            onPressed: () {},
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                //new Text('Button with text and icon!'),
                                                //new Icon(Icons.save),
                                                Text(
                                                  'Accept',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bid Requests",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  //elevation: 5,
                  height: 200,
                  //color: Colors.deepPurple[50],
                  child: Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: _fetchbid(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          // print(snapshot.data);
                          // print("bid avooooo");
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
                                    Text("No bid requests!"),
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
                                          height: 2,
                                        ),
                                        Center(
                                            child: Text(
                                          'From:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )),
                                        Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                            'Star rating:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          )),
                                        ),
                                        Center(
                                          child: new StarRating(
                                            size: 25.0,
                                            rating: (snapshot.data[id].rating)
                                                .toDouble(),
                                            color: Colors.deepPurple,
                                            borderColor: Colors.deepPurple,
                                            starCount: 5,
                                            onRatingChanged: (rating) =>
                                                setState(
                                              () {
                                                //this.rating = rating;
                                              },
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                              'Bid value:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                        ),
                                         Center(
                                          child: Text(
                                              (snapshot.data[id].bidval).toString()+' \$',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                        ),
                                        SizedBox(
                                          // width: deviceWidth*,
                                          child: RaisedButton(
                                            color: Colors.indigo,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40),
                                            textColor: Colors.white,
                                            onPressed: () {},
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                //new Text('Button with text and icon!'),
                                                //new Icon(Icons.save),
                                                Text(
                                                  'Accept',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Direct Requests",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  //elevation: 5,
                  height: 160,
                  //color: Colors.deepPurple[50],
                  child: Column(
                    children: <Widget>[
                      FutureBuilder(
                        future: _fetchdir(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          // print(snapshot.data);
                          // print("direct avooooo");
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
                                    Text("No direct requests!"),
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
                                          height: 2,
                                        ),
                                        Center(
                                            child: Text(
                                          'From:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )),
                                        Center(
                                          child: new Text(
                                            snapshot.data[id].firstname +
                                                " " +
                                                snapshot.data[id].lastname,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                              child: Text(
                                            'Star rating:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          )),
                                        ),
                                        Center(
                                          child: new StarRating(
                                            size: 25.0,
                                            rating: (snapshot.data[id].rating)
                                                .toDouble(),
                                            color: Colors.deepPurple,
                                            borderColor: Colors.deepPurple,
                                            starCount: 5,
                                            onRatingChanged: (rating) =>
                                                setState(
                                              () {
                                                //this.rating = rating;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          // width: deviceWidth*,
                                          child: RaisedButton(
                                            color: Colors.indigo,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40),
                                            textColor: Colors.white,
                                            onPressed: () {},
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                //new Text('Button with text and icon!'),
                                                //new Icon(Icons.save),
                                                Text(
                                                  'Accept',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
  int clientid;
  String firstname;
  String lastname;
  int rating;
  int bidval;
  Fix(this.id, this.clientid, this.firstname, this.lastname, this.rating,this.bidval);

  // Fix.fromMap(Map<String, dynamic> map) {
  //   this.clientid = map['skill'];
  // }
}
