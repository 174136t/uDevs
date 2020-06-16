import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:udevs/Projects/Blockpro.dart';
//import 'package:udevs/splash.dart';
//import 'package:udevs/Developer/devhometab.dart';
import 'package:udevs/models/projects.dart';
import 'package:http/http.dart' as http;
class Blockpro extends StatefulWidget {
  final Project project;

  Blockpro(this.project);
  @override
  _BlockproState createState() => _BlockproState();
}

class _BlockproState extends State<Blockpro> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String bid;
  void _submitbid() {
    if (!_formKey.currentState.validate()) {
      // _showSnackBar('Check again you have miss something !');
      return;
    }
    _formKey.currentState.save();
    
    registerRequest();
  }
 void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  void registerRequest() async {
    var url = 'http://192.168.1.8:3000/users/dev_home/sendBid';
    try{
final prefs = await SharedPreferences.getInstance();
    int did = prefs.getInt('id');
int proid=widget.project.id;
    var body = {
      'developer_ID': '$did',
      'project_ID': "$proid",
      'bid_value': "$bid",     
    };
    http.post(url, body: body).then((http.Response response) {
      print("****************************************");
      print(response.body);
      print('${response.statusCode}');
      Map<String, dynamic> res = json.decode(response.body);

      if (res['success']==1) {
        _showDialog();
      } 
    });
    }catch(error){
      
       _showSnackBar('Something went wrong!');
    }
  }
void reqpro() async {
    var url = 'http://192.168.1.8:3000/users/dev_home/sendRequest';
    try{
final prefs = await SharedPreferences.getInstance();
    int did = prefs.getInt('id');
int proid=widget.project.id;
    var body = {
      'developer_ID': '$did',
      'project_ID': "$proid",
          
    };
    http.post(url, body: body).then((http.Response response) {
      print("****************************************");
      print(response.body);
      print('${response.statusCode}');
      Map<String, dynamic> res = json.decode(response.body);

      if (res['success']==1) {
        _showDialo();
      } 
    });
    }catch(error){
      
       _showSnackBar('Something went wrong!');
    }
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Bid successful!"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
          ],
        );
      },
    );
  }
void _showDialo() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Request sent"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginScreen()),
                // );
              },
            ),
          ],
        );
      },
    );
  }
  Widget submitBidButton() {
    return SizedBox(
        height: 40.0,
        width: 350,
        child: RaisedButton(
          color: Colors.pink,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          textColor: Colors.white,
          onPressed: _submitbid,
          //() {
          // if (_formKey.currentState.validate()) {
          //   _formKey.currentState.save();
          // //  loginRequest();

          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(builder: (context) => HomePage()),
          //   // );
          // }
          //},
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //new Text('Button with text and icon!'),
              new Icon(Icons.money_off),
              Text(
                '  Submit Bid',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }

  Widget requestproButton() {
    return SizedBox(
        height: 40.0,
        width: 350,
        child: RaisedButton(
          color: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          textColor: Colors.white,
          onPressed: () {
            reqpro();
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //new Text('Button with text and icon!'),
              new Icon(Icons.bookmark),
              Text(
                'Request this project',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }

  Widget _buildbidTextField() {
    return Container(
      // width: 300,
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //icon: Icon(Icons.keyboard),
            prefixIcon: Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(
                Icons.monetization_on,
                color: Colors.black,
              ), // icon is 48px widget.
            ),
            hintText: 'bid value ',
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
            filled: true,
            fillColor: Colors.white70),
        validator: (String value) {
          if (value.isEmpty) {
            return ' Invalid bid amount';
          }
        },
        keyboardType: TextInputType.numberWithOptions(),
        onSaved: (String value) {
          this.bid = value;
          //_formData['contact_no'] = value;
        },
      ),
    );
  }

  String bidi = '';
  bool loading = false;
  void _fetchbidval() async {
    var url = 'http://192.168.1.8:3000/users/project/viewBid';
    int proid = widget.project.id;
    var body = {'project_ID': '$proid'};
    var data = await http.post(url, body: body);
    var jsonData = json.decode(data.body);
    print("bidddddddddddddddddddddddddddddd");
    print(jsonData);
    bidi = jsonData['maximum_value'];
    print(bidi);
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
      key: _scaffoldKey,
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('uDevs'),
        centerTitle: true,
      ),
      body: Container(
        decoration: new BoxDecoration(
            color: Colors.grey[100],
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
                Card(
                  color: Colors.grey[100],
                  child: Container(
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
                            child: Container(
                              color: Colors.blue[50],
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
                          new Card(
                            child: Container(
                              color: Colors.blue[50],
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
                          new Card(
                            child: Container(
                              color: Colors.blue[50],
                              width: deviceWidth * 0.96,
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
                                        ? "Bid project"
                                        : widget.project.payment + "\$",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'About Client',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: deviceWidth * 0.98,
                  child: Card(
                    color: Colors.grey[200],
                    child: new Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 170.0,
                              width: 160,
                              child: Container(
                                height: 200,
                                width: deviceWidth * 0.5,
                                decoration: new BoxDecoration(
                                  color: const Color(0xff7c94b6),
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                        "assets/images.png"),
                                    fit: BoxFit.scaleDown,
                                  ),
                                  border: Border.all(
                                      color: Colors.black, width: 2.0),
                                  borderRadius: new BorderRadius.all(
                                      const Radius.circular(80.0)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  widget.project.clientfirstname +
                                      " " +
                                      widget.project.clientlastname,
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Star rating:'),
                                StarRating(
                                  size: 25.0,
                                  rating: (widget.project.rating).toDouble(),
                                  color: Colors.deepPurple,
                                  borderColor: Colors.deepPurple,
                                  starCount: 5,
                                  onRatingChanged: (rating) => setState(
                                    () {
                                      //this.rating = rating;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Member Since:'),
                                Text((widget.project.member).substring(0, 10))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                widget.project.payment.isEmpty?
                Container(
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: deviceWidth * 0.98,
                  child: Card(
                    color: Colors.grey[200],
                    child: new Column(
                      children: <Widget>[
                        Text(
                          'Maximum bid amount:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          widget.project.payment.isNotEmpty
                              ? '0' + " \$"
                              : bidi + " \$",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Put your bid here',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Form(
                          key: _formKey,
                          child: _buildbidTextField(),
                        ),
                       
                        SizedBox(
                          height: 15,
                        ),
                        submitBidButton(),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                )
                :Container(),
                SizedBox(
                  height: 20,
                ),
                requestproButton(),
                SizedBox(
                  height: 20,
                ),
                 widget.project.payment.isEmpty?
                 Container(
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: deviceWidth * 0.98,
                  child: Card(
                    color: Colors.grey[500],
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Who have bid so far',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Card(
                          child: Container(
                            color: Colors.red[100],
                            width: deviceWidth * 0.95,
                            height: 100,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                :Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

