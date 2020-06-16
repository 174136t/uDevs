import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
//import 'package:udevs/Projects/webpro.dart';
//import 'package:udevs/splash.dart';
//import 'package:udevs/Developer/devhometab.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udevs/Developer/devprofiletab.dart';
import 'package:udevs/models/user.dart';

class Digidev extends StatefulWidget {
  final User user;

  Digidev(this.user);
  @override
  _DigidevState createState() => _DigidevState();
}

class _DigidevState extends State<Digidev> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void registerRequest() async {
    var url = 'http://192.168.1.8:3000/users/';
// print(firstName);
// print(lastName);
    var body = {
      //'role': 'client',
      // 'first_name': "$firstName",
      // 'last_name': "$lastName",
      // 'user_type': "Developer",
      // 'email': "$email",
      // 'gender':"$gender",
      // 'password': "$password",
      // 'contact_no': "$phone",
    };
    // final Map<String, dynamic> userdata = {
    //   'first_name': firstName,
    //   'last_name': lastName,
    //   'email': email,
    //   'contact_no': phone,
    //   'password': password,
    // };
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return buildLoadingDialog();
    //     });

    //print(body);

    http.post(url, body: body).then((http.Response response) {
      // print("***********");
      // print(response.body);
      // print('${response.statusCode}');
      Map<String, dynamic> res = json.decode(response.body);

      if (res['success'] == 1) {
        //print(res['msg']);
        // Navigator.of(context).pushNamedAndRemoveUntil(
        //   '/login',
        //   ModalRoute.withName('/user'),
        // );
        _showDialog();
      } else {
        //invalidAuth();
        Navigator.of(context).pop();
        // invalidAuth();
      }
    });
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

  Widget requestDevButton() {
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
            // if (_formKey.currentState.validate()) {
            //   _formKey.currentState.save();
            // //  loginRequest();

            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => HomePage()),
            //   // );
            // }
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //new Text('Button with text and icon!'),
              new Icon(Icons.bookmark),
              Text(
                'Request developer',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }

  Widget _textArea() {
    return Card(
      elevation: 5,
      color: Colors.deepPurple[50],
      child: Container(
        height: 100,
      ),
    );
  }
Widget _skillArea() {
    return Card(
      elevation: 5,
      color: Colors.deepPurple[50],
      child: Container(
        height: 100,
      ),
    );
  }
Widget _techArea() {
    return Card(
      elevation: 5,
      color: Colors.deepPurple[50],
      child: Container(
        height: 100,
      ),
    );
  }
  final String url1 = "http://192.168.1.8:3000/users/cli_home/cli_getTechno";

  Future<List<Technology>> _fetchtech() async {
    print('fetching Tech');
    // final prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('token');
    //print(token);
    int id = widget.user.id;
    print(id);
    //var jsonData;
    var body = {'user_ID': '$id'};
    var data= await http.post(url1, body: body);
       var jsonData = json.decode(data.body);
    print(jsonData);
    List<Technology> techs = [];
    for (var d in jsonData) {
      Technology tech = Technology(
        d["technology"],
      );
      techs.add(tech);
    }
    print("^^^^^^^^^^^^^^^^^^^^^^^^^");
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
                  'About Developer',
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
                          elevation: 5,
                          child: Container(
                            color: Colors.blue[50],
                            width: deviceWidth * 0.96,
                            child: new Column(
                              children: <Widget>[
                                Text(
                                  'Developer\'s Name: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  widget.user.firstname +
                                      " " +
                                      widget.user.lastname,
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
                          elevation: 5,
                          child: Container(
                            color: Colors.blue[50],
                            width: deviceWidth * 0.96,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Email: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  widget.user.email,
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
                          elevation: 5,
                          child: Container(
                            color: Colors.blue[50],
                            width: deviceWidth * 0.96,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Contact number: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  widget.user.contactno,
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
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  width: deviceWidth * 0.98,
                  child: Card(
                    elevation: 5,
                    color: Colors.deepPurple[50],
                    child: new Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 160.0,
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
                                Text('Star rating:'),
                                StarRating(
                                          size: 25.0,
                                          rating: (widget.user.rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                Text('Member Since:'),
                                Text(widget.user.creat)
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
                // new Text(
                //         ' Skills',
                //         style: TextStyle(
                //             fontSize: 20.0, fontWeight: FontWeight.bold),
                //       ),
                //       _skillArea(),
                //       SizedBox(height: 10,),
                      new Text(
                        ' Technologies',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                       Container(
                    //elevation: 5,
                    height: 45,
                    //color: Colors.deepPurple[50],
                    child: Column(
                      children: <Widget>[
                        FutureBuilder(
                          future: _fetchtech(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            print(snapshot.data);
                            print("tech avooooo");
                            if (snapshot?.data?.isEmpty??true) {
                              return Container(
                                //height: 10,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      CircularProgressIndicator(),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                     // Text("No technologies added!"),
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
                                   // width: deviceWidth / 2,
                                    child: Card(
                                      color: Colors.deepPurple[50],
                                      elevation: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: new Text(
                                              snapshot.data[id].techno,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
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
                  height: 5,
                ),
                requestDevButton(),
                SizedBox(
                  height: 8,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      ' Feedbacks',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    FlatButton(
                      child: Text(
                        '                                More',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                _textArea(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
