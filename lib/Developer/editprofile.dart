import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Developer/devprofiletab.dart';

class Editprofile extends StatefulWidget {
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _firstname;

  TextEditingController _lastname;

  TextEditingController _email;

  TextEditingController _phone;

  TextEditingController _password;
  TextEditingController _password2;

  final String url = "http://192.168.1.8:3000/users/profile";
  final String url1 = "http://192.168.1.8:3000/users/editProf";
  String token;
  String email;
  String password;
  String firstName;
  String lastName;
  String phone;
  String gender;
  String radioValue = '';
  bool loading = false;

  void _fetchProfile() async {
    Profile fetchpro;
    //print('editing');
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    //String password=prefs.getString('password');
    email = prefs.getString('email');
    http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: token},
    ).then((value) {
      var jsonData = json.decode(value.body);
      fetchpro = Profile.fromMap(jsonData);
      _firstname = TextEditingController(text: fetchpro.firstname);
      _lastname = TextEditingController(text: fetchpro.lastname);
      _email = TextEditingController(text: email);
      _phone = TextEditingController(text: fetchpro.contactno);
      _password = TextEditingController(text: fetchpro.password);
      _password2 = TextEditingController(text: fetchpro.password);
      password = fetchpro.password;
      setState(() {
        loading = false;
      });
    });
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || radioValue == '') {
      _showSnackBar('Check again!');
      return;
    }
    _formKey.currentState.save();
    // Navigator.pushReplacementNamed(context, '/dpp');
    //  Navigator.push(
    //                                     context,
    //                                     MaterialPageRoute(
    //                                       builder: (context) => DevSkillPage(),
    //                                     ));
    editpro();
  }

  void editpro() async {
    var url = 'http://192.168.1.8:3000/users/editProf';
// print(firstName);
// print(lastName);
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id');
    print(id);
    var body = {
      //'role': 'client',
      'id': "$id",
      'first_name': "$firstName",
      'last_name': "$lastName",
      'user_type': "Developer",
      'email': "$email",
      'password': "$password",
      'gender': "$gender",
      'contact_no': "$phone",
      'isActivated': "1"
    };

    http.post(url, body: body).then((http.Response response) {
      // print("***********");
      //print(response.body);
      // print('${response.statusCode}');
      Map<String, dynamic> res = json.decode(response.body);

      if (res['success'] == 1) {
        _showDialog();
      } else {
        _showSnackBar('Something went wrong!');
// Navigator.of(context).pop();
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
          title: new Text("Profile updated succesfully!"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DevProfileScreen()),
                // );
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildLoadingDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: CircularProgressIndicator(),
          title: Text('Loading...'),
        ),
      ),
    );
  }

  // void invalidAuth() {
  //   setState(() {
  //     this.invalidMsg = "This user already exists!";
  //     _showSnackBar(invalidMsg);
  //     _formKey.currentState.reset();
  //   });
  // }

//   void _showSnackBar(message) {
//     final snackBar = new SnackBar(
//       content: new Text(message),
//     );
//     _scaffoldKey.currentState.showSnackBar(snackBar);
//   }
// }

  @override
  void initState() {
    setState(() {
      loading = true;
      _fetchProfile();
    });
    print(
        'init state **********************************************************');
    super.initState();
  }
  // @override
  //  setState(() {
  //     h
  //   });

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          // decoration: BoxDecoration(image: _backgroundImage()
          //     //image: _buildBackgroundImage(),
          //     ),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.deepPurple[300], Colors.black54],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: loading
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Container(
                      width: targetWidth,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            new Container(
                              child: new Column(
                                children: <Widget>[
                                  Text(
                                    'First Name:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  // _buildfirstnameTextField(),
                                  Container(
                                    // width: 300,
                                    child: TextFormField(
                                      controller: _firstname,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          //icon: Icon(Icons.keyboard),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(
                                              Icons.person_pin,
                                              color: Colors.black,
                                            ), // icon is 48px widget.
                                          ),
                                          // hintText: profile.firstname,
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          filled: true,
                                          fillColor: Colors.white70),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "First name can't be empty ";
                                        }
                                      },
                                      onSaved: (String value) {
                                        this.firstName = value;
                                        //_formData['first_name'] = value;
                                        // setState(() {
                                        //  _firstname.text=value;
                                        // });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    'Last Name:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  // _buildlastnameTextField(),
                                  Container(
                                    // width: 300,
                                    child: TextFormField(
                                      controller: _lastname,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          //icon: Icon(Icons.keyboard),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(
                                              Icons.person_pin,
                                              color: Colors.black,
                                            ), // icon is 48px widget.
                                          ),
                                          // hintText: profile.lastname,
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          filled: true,
                                          fillColor: Colors.white70),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return " Last name can't be empty ";
                                        }
                                      },
                                      onSaved: (String value) {
                                        this.lastName = value;
                                        // _formData['last_name'] = value;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    'Email:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  // _buildEmailTextField(),
                                  Container(
                                      // width: 300,
                                      child: TextFormField(
                                    controller: _email,
                                    autofocus: false,
                                    enabled: false,
                                    decoration: InputDecoration(
                                        // icon: Icon(Icons.email),

                                        contentPadding:
                                            new EdgeInsets.symmetric(
                                                vertical: 10.0,
                                                horizontal: 10.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        // icon: Icon(Icons.email),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(
                                            Icons.email,
                                            color: Colors.black,
                                          ), // icon is 48px widget.
                                        ),
                                        //  hintText: profile.email,
                                        hintStyle: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        filled: true,
                                        fillColor: Colors.white70
                                        //border: OutlineInputBorder(
                                        //  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
                                        ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (String value) {
                                      if (value.isEmpty ||
                                          !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                              .hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                    },
                                    // onSaved: (String value) {
                                    //   this.email = value;
                                    //_formData['email'] = value;
                                    // },
                                  )),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    'Gender:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  new Column(
                                    children: <Widget>[
                                      Container(
                                        //height: 50,
                                        decoration: new BoxDecoration(
                                            color: Colors.white70,
                                            //new Color.fromRGBO(255, 0, 0, 0.0),

                                            borderRadius: new BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(10.0),
                                                topRight:
                                                    const Radius.circular(10.0),
                                                bottomLeft:
                                                    const Radius.circular(10.0),
                                                bottomRight:
                                                    const Radius.circular(
                                                        10.0))),
                                        //color: Colors.white,

                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 3,
                                              ),
                                              //Row(
                                              //   children: <Widget>[
                                              //     SizedBox(width: 12,),
                                              //     Icon(Icons.wc),
                                              //      SizedBox(width: 12,),
                                              //     Text(
                                              //       'Gender',
                                              //       style: TextStyle(fontSize: 14,color: Colors.black54)
                                              //       ,
                                              //     ),
                                              //   ],
                                              // ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  //  SizedBox(width: 12,),
                                                  //   Icon(Icons.wc),
                                                  //   SizedBox(width: 12,),
                                                  // Text('Gender'),
                                                  Flexible(
                                                    fit: FlexFit.loose,
                                                    child: new RadioListTile<
                                                            String>(
                                                        dense: false,
                                                        title: new Text(
                                                          'Male',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        value: 'Male',
                                                        groupValue: radioValue,
                                                        onChanged:
                                                            (String value) {
                                                          setState(() {
                                                            radioValue = value;
                                                            // _formData['gender'] =
                                                            //     radioValue;
                                                            this.gender =
                                                                radioValue;
                                                          });
                                                        }),
                                                  ),
                                                  Flexible(
                                                    fit: FlexFit.loose,
                                                    child: new RadioListTile<
                                                            String>(
                                                        title: new Text(
                                                          'Female',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        value: 'Female',
                                                        groupValue: radioValue,
                                                        onChanged:
                                                            (String value) {
                                                          setState(() {
                                                            radioValue = value;
                                                            // _formData['gender'] =
                                                            //     radioValue;
                                                            this.gender =
                                                                radioValue;
                                                          });
                                                        }),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    'Phone Number:',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  //_buildtpnoTextField(),
                                  Container(
                                    // width: 300,
                                    child: TextFormField(
                                      controller: _phone,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              new EdgeInsets.symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 10.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          //icon: Icon(Icons.keyboard),
                                          prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(
                                              Icons.phone_android,
                                              color: Colors.black,
                                            ), // icon is 48px widget.
                                          ),
                                          //  hintText: profile.contactno,
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          filled: true,
                                          fillColor: Colors.white70),
                                      validator: (String value) {
                                        if (value.isEmpty ||
                                            value.length != 10 ||
                                            !RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$")
                                                .hasMatch(value)) {
                                          return ' Invalid phone number';
                                        }
                                      },
                                      keyboardType:
                                          TextInputType.numberWithOptions(),
                                      onSaved: (String value) {
                                        this.phone = value;
                                        //_formData['contact_no'] = value;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),

                                  SizedBox(
                                    width: 200,
                                    child: RaisedButton(
                                      color: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40),
                                      textColor: Colors.white,
                                      onPressed: _submitForm,
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          //new Text('Button with text and icon!'),
                                          //new Icon(Icons.save),
                                          Text(
                                            'Save!',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 15.0,
                                  ),

                                  SizedBox(
                                    height: 30.0,
                                  ),
                                ],
                              ),
                            ),

                            // _buildAcceptSwitch(),
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
