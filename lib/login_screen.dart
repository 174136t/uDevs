import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udevs/Client/clienthome.dart';
import 'package:udevs/Developer/devloperhome.dart';
//import 'package:udevs/functions/saveCurrentLogin.dart';
import 'package:udevs/functions/showDialogbtn.dart';
//import 'package:udevs/models/loginmodel.dart';
import 'package:udevs/usertype.dart';
import 'package:udevs/Client/createAccount.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:simple_auth_flutter/simple_auth_flutter.dart';

// class User {
//   final String email;
//   final String password;
//   final String token;
//   User({@required this.email, @required this.password, @required this.token});
// }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String email;
  String password;
  String invalidMsg = "ayyooo";
  String token;
  int id;
  String userType;
//bool _isLoading = false;
  DateTime currentBackPressTime = DateTime.now();
 // bool loading = false;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2))
      currentBackPressTime = now;
    return showDialog(
      context: context,
      builder: (context) => new Theme(
        data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.grey[100],
            backgroundColor: Colors.white),
        child: AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit from this App'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => exit(0),
              child: new Text('Yes'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
           decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.deepPurple[300], Colors.black54],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/t.jpg'), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            
            // appBar: AppBar(
            //   title: Text('uDevs'),
            //   centerTitle: true,
            //   automaticallyImplyLeading: false,
            // ),
            key: _scaffoldKey,
            //   backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                // decoration: BoxDecoration(
                //   image: _backgroundImage(),
                // ),

                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Container(
                    width: targetWidth,
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            // padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            children: <Widget>[
                              //_backgroundImage(),
                              SizedBox(height: 100.0),
                              //logo(),
                              Container(
                                color: Colors.pink,
                                child: SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'uDevs',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 50.0),
                              emailField(),
                              SizedBox(height: 10.0),
                              passwordField(),
                              SizedBox(height: 40.0),
                              loginButton(),
                              SizedBox(height: 60.0),
                              // forgetPasswordButton(),
                              //createAccountButton(),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    '   Don\'t have an account yet? ',
                                    style: new TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0.0, right: 10.0, top: 0.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UserTypePage(),
                                            ));
                                      },
                                      child: new Container(
                                          alignment: Alignment.center,
                                          height: 40.0,
                                          decoration: new BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      9.0)),
                                          child: new Text("Create one",
                                              style: new TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.blue))),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

 
// Widget logo() {
//   return Center(

//     //child: CircleAvatar(
//     child: Image(image: AssetImage('assets/abc.jpeg'),fit: BoxFit.cover,),
//     //     maxRadius: 60.0,
//     //     minRadius: 20.0,
//     //     backgroundColor: Colors.transparent,
//     //  // ),
//   );
// }
  void _showSnackBar() {
    final snackBar = SnackBar(
      content: Text('Something went wrong! Try Again!'),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blueGrey,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget logo() {
    return Center(
      //child: CircleAvatar(
      child: Image(image: AssetImage('assets/abc.jpeg')),
      //     maxRadius: 60.0,
      //     minRadius: 20.0,
      //     backgroundColor: Colors.transparent,
      //  // ),
    );
  }

  Widget emailField() {
    return Container(
        width: 300,
        child: TextFormField(
          autofocus: false,
          decoration: InputDecoration(
              // icon: Icon(Icons.email),

              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              // icon: Icon(Icons.email),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.email,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'E-Mail',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.white70
              //border: OutlineInputBorder(
              //  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value.isEmpty ||
                !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
              return 'Please enter a valid email';
            }
          },
          onSaved: (String value) {
            this.email = value;
          },
        ));
  }

  Widget passwordField() {
    return Container(
        width: 300,
        child: TextFormField(
          autofocus: false,
          obscureText: true,
          decoration: InputDecoration(
              // icon: Icon(Icons.keyboard),
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              // enabledBorder:  OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(color: Colors.white)
              // ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              //icon: Icon(Icons.keyboard),
              prefixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: Icon(
                  Icons.vpn_key,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black),
              errorStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.white70
              //border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              ),
          validator: (value) {
            if (value.isEmpty || value.length < 6) {
              return 'Password length must be at least 6';
            }
          },
          onSaved: (String value) {
            this.password = value;
          },
        ));
  }

  Widget loginButton() {
    return SizedBox(
        height: 40.0,
        width: 200,
        child: RaisedButton(
          color: Colors.indigo,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          textColor: Colors.white,
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              loginRequest();

              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomePage()),
              // );
            }
          },
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //new Text('Button with text and icon!'),
              new Icon(Icons.lightbulb_outline),
              Text(
                '  Sign in',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }

  Widget forgetPasswordButton() {
    return FlatButton(
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget createAccountButton() {
    return FlatButton(
      child: Text(
        'Create new Account',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateAccountPage()),
        );
      },
    );
  }

  loginRequest() async { 
    var url = 'http://192.168.1.8:3000/users';

    print(email);
    print(password);
    var body = {
      "email": "$email",
      "password": "$password",
    };

    return http.post(url, body: body).then(
      (http.Response response) {   
        print('***************************************');
        print('${response.statusCode}');
        print(response.body);

        final res = json.decode(response.body);
        print('rrrrrrrrrrrrrrrrrrrrrrrrr');
print(res);
        if (res['success'] == 1) {
          // saveCurrentLogin(res);
          setState(() {
            token = res['token'];
            email = email;
            id = res['user']['id'];
            userType = res['user']['user_type'];
          });
          _savePreference();
          _read();

          if (res['user']['user_type'] == 'Developer') {
          
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DevHomePage()),
                );
          
          }

          if (res['user']['user_type'] == 'Client') {
          
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
          }
          //return LoginModel.fromJson(res);
        } else if (res['success'] == 0) {
          //_showmsg();
          // final res = json.decode(response.body);

          // saveCurrentLogin(res);
          showDialogSingleButton(context, "Login Failed",
              "Invalid 'Email' or 'Password'\nPlease try again .", "OK");
          // return null;
        }
      },
    );
  }

  void invalidAuth() {
    setState(() {
      this.invalidMsg = "Invalid Username or Password";
      _showSnackBar();
      _formKey.currentState.reset();
    });
  }



  void invalidAuthUserBlocked() {
    setState(() {
      this.invalidMsg = "Can't login! You are blocked!";
      //_showSnackBar(invalidMsg);
      _formKey.currentState.reset();
    });
  }

  _savePreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', id);
    prefs.setString('token', token);
    prefs.setString('userType', userType);
    prefs.setString('email', email);
    prefs.setString('password', password);
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
    final id = prefs.getInt('id') ?? 0;
    print(id);
    final token = prefs.getString('token') ?? " ";
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    print(token);
    final userType = prefs.getString('userType') ?? " ";
    print(userType);
    final email = prefs.getString('email') ?? " ";
    print(email);
    final password = prefs.getString('password') ?? " ";
    print(password);
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

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Login Successfull"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DevHomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showdialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Login Successfull"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showmsg() {
    // flutter defined function
    setState(() {
      // this.invalidMsg = "Can't login! You are blocked!";
      //_showSnackBar(invalidMsg);
      _formKey.currentState.reset();
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Invalid email or password"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // _showSnackBar(String invalidMsg) {

  //   _scaffoldKey.currentState.showSnackBar(
  //     SnackBar(
  //     content: Text(
  //       invalidMsg,
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     duration: Duration(seconds: 30),
  //     backgroundColor: Colors.blueGrey,
  //   )
  //   );
  //  // Scaffold.of(context).showSnackBar(snackBar);
  // }
}
