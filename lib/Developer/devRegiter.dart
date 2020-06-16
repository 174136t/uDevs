import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:udevs/devSkills.dart';
//import 'devLogin.dart';
//import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:udevs/login_screen.dart';
//import 'devProfilePic.dart';

main() {
  runApp(DevRegisterPage());
}

class DevRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DevRegisterPageState();
  }
}

class _DevRegisterPageState extends State<DevRegisterPage> {
  final Map<String, dynamic> _formData = {
    'acceptTerms': false,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //var passKey = GlobalKey<FormFieldState>();
  final TextEditingController _password = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String invalidMsg = "";
  String email;
  String password;
  String firstName;
  String lastName;
  String phone;
  String gender;
  String confirmPassword;
  String radioValue = '';
  Widget _buildEmailTextField() {
    return Container(
        // width: 300,
        child: TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          // icon: Icon(Icons.email),

          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          // icon: Icon(Icons.email),
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.email,
              color: Colors.black,
            ), // icon is 48px widget.
          ),
          hintText: 'E-Mail',
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
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
      onSaved: (String value) {
        this.email = value;
        //_formData['email'] = value;
      },
    ));
  }

  Widget _buildPasswordTextField() {
    return Container(
        // width: 300,
        child: TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _password,
      decoration: InputDecoration(
          // icon: Icon(Icons.keyboard),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          //icon: Icon(Icons.keyboard),
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.vpn_key,
              color: Colors.black,
            ), // icon is 48px widget.
          ),
          hintText: 'Password',
          hintStyle: TextStyle(fontSize: 14, color: Colors.black),
          filled: true,
          fillColor: Colors.white70
          //border: OutlineInputBorder(
          //   borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          ),
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password length must be greater than 6';
        }
      },
      onSaved: (String value) {
        this.password = value;
        //_formData['password'] = value;
      },
    ));
  }

  Widget _buildfirstnameTextField() {
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
                Icons.person_pin,
                color: Colors.black,
              ), // icon is 48px widget.
            ),
            hintText: 'First Name',
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
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
        },
      ),
    );
  }

  Widget _buildlastnameTextField() {
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
                Icons.person_pin,
                color: Colors.black,
              ), // icon is 48px widget.
            ),
            hintText: 'Last Name',
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
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
    );
  }

  Widget _buildtpnoTextField() {
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
                Icons.phone_android,
                color: Colors.black,
              ), // icon is 48px widget.
            ),
            hintText: 'Phone number ',
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
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
        keyboardType: TextInputType.numberWithOptions(),
        onSaved: (String value) {
          this.phone = value;
          //_formData['contact_no'] = value;
        },
      ),
    );
  }

  Widget _buildconfirmpwTextField() {
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
                Icons.vpn_key,
                color: Colors.black,
              ), // icon is 48px widget.
            ),
            hintText: 'Confirm password',
            hintStyle: TextStyle(fontSize: 14, color: Colors.black),
            filled: true,
            fillColor: Colors.white70),
        obscureText: true,
        validator: (String value) {
          // var password = passKey.currentState.value;

          if (_password.text != value) {
            return 'Both passwords must be the same';
          }
        },
      ),
    );
  }

//method for accept terms
  Widget _buildAcceptCheck() {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Colors.white),
      child: CheckboxListTile(
        value: _formData['acceptTerms'],
        onChanged: (bool value) {
          setState(() {
            _formData['acceptTerms'] = value;
          });
        },
        title: Text(
          'Accept terms',
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  //method register form starts here
  void _registerForm() {
    if (!_formKey.currentState.validate() ||
        !_formData['acceptTerms'] ||
        radioValue == '') {
      _showSnackBar('Check again you have miss something !');
      return;
    }
    _formKey.currentState.save();
    print(_formData);
    registerRequest();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.deepPurple[300], Colors.black],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Colors.pink,
                        child: SizedBox(
                          height: 40,
                          child: Center(
                            child: Text(
                              'Create new account',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _buildfirstnameTextField(),
                      SizedBox(
                        height: 3.0,
                      ),
                      _buildlastnameTextField(),
                      SizedBox(
                        height: 3.0,
                      ),
                      _buildEmailTextField(),
                      SizedBox(
                        height: 3.0,
                      ),
                      new Column(
                        children: <Widget>[
                          Container(
                            //height: 50,
                            decoration: new BoxDecoration(
                                color: Colors
                                    .white70, //new Color.fromRGBO(255, 0, 0, 0.0),
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(10.0),
                                    topRight: const Radius.circular(10.0),
                                    bottomLeft: const Radius.circular(10.0),
                                    bottomRight: const Radius.circular(10.0))),
                            //color: Colors.white,

                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: new RadioListTile<String>(
                                            dense: false,
                                            title: new Text(
                                              'Male',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            value: 'Male',
                                            groupValue: radioValue,
                                            onChanged: (String value) {
                                              setState(() {
                                                radioValue = value;
                                                // _formData['gender'] =
                                                //     radioValue;
                                                this.gender = radioValue;
                                              });
                                            }),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: new RadioListTile<String>(
                                            title: new Text(
                                              'Female',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            value: 'Female',
                                            groupValue: radioValue,
                                            onChanged: (String value) {
                                              setState(() {
                                                radioValue = value;
                                                // _formData['gender'] =
                                                //     radioValue;
                                                this.gender = radioValue;
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
                        height: 3.0,
                      ),
                      _buildtpnoTextField(),
                      SizedBox(
                        height: 3.0,
                      ),
                      _buildPasswordTextField(),
                      SizedBox(
                        height: 3.0,
                      ),
                      _buildconfirmpwTextField(),

                      // _buildAcceptSwitch(),
                      SizedBox(
                        height: 3.0,
                      ),

                      _buildAcceptCheck(),
                      SizedBox(
                        width: 200,
                        child: RaisedButton(
                          color: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          textColor: Colors.white,
                          onPressed: _registerForm,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              //new Text('Button with text and icon!'),
                              new Icon(Icons.lock_open),
                              Text('  Register'),
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerRequest() async {
    var url = 'http://192.168.1.8:3000/users/dev_register';
// print(firstName);
// print(lastName);
    var body = {
      //'role': 'client',
      'first_name': "$firstName",
      'last_name': "$lastName",
      'user_type': "Developer",
      'email': "$email",
      'gender': "$gender",
      'password': "$password",
      'contact_no': "$phone",
    };

    http.post(url, body: body).then((http.Response response) {
      Map<String, dynamic> res = json.decode(response.body);

      if (res['success'] == 1) {
        _showDialog();
      } else {
        invalidAuth();
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
          title: new Text("Successfully registered"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Got it"),
              onPressed: () {
                Navigator.of(context).pop();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void invalidAuth() {
    setState(() {
      this.invalidMsg = "This user already exists!";
      _showSnackBar(invalidMsg);
      _formKey.currentState.reset();
    });
  }

  void _showSnackBar(message) {
    final snackBar = new SnackBar(
      content: new Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
