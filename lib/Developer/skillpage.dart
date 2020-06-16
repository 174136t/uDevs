import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class SkillPage extends StatefulWidget {
  @override
  _SkillPageState createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  var mySkills;
  var myTechnologies;

  String p;
  String _mySkillsResult;
  String _myTechResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // mySkills = [];
    // myTechnologies = [];
    _mySkillsResult = '';
    _myTechResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
     // setState(() {
        // _mySkillsResult = _mySkills.toString();
        // _myTechResult = _myTechnologies.toString();
        //  _save();
        postSkill();
        // _showDialog();
     // });
    }
  }

//   _save() async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('skill', _mySkillsResult);
//     prefs.setString('tech', _myTechResult);
//     // prefs.setString('userType', userType);
//     // prefs.setString('email', email);
//   }
//   _read() async {
//     final prefs = await SharedPreferences.getInstance();
//      int id = prefs.getInt('id') ?? 0;
// print(id);
//    }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Skills & technologies added successfully"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showerrorDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Something went wrong!"),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void postSkill() async {
    var url = 'http://192.168.1.8:3000/users/skill';
    var url1 = 'http://192.168.1.8:3000/users/techno';
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id') ?? 0;
    print(id);
    print(mySkills);
    print(myTechnologies);
    // String a=mySkills.toString();
    //  var b=(myTechnologies.toString());
    //  print(a);
    //      print(b);

    Map<String, dynamic> body = {
      'user_ID': "$id",
      'data': "$mySkills",
    };

    http.post(url, body: body).then((http.Response response) {
      print("***********");
      print(response.body);
      print('${response.statusCode}');
      // Map<String, dynamic> res = json.decode(response.body);

      if (response.statusCode == 200) {
        print('%%%%%%%%%%%%%%');
        print(response.statusCode);
        Map<String, dynamic> body = {
          'user_ID': "$id",
          'data': "$myTechnologies",
        };
        http.post(url1, body: body).then((http.Response response) {
          if (response.statusCode == 200) {
            _showDialog();
          }
          else {
        _showerrorDialog();
      }
        });
      } else {
        _showerrorDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add skills & technologies'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.deepPurple[300], Colors.black54],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    decoration: new BoxDecoration(
                        //color: Colors
                        //   .white70, //new Color.fromRGBO(255, 0, 0, 0.0),
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0))),
                    //  color: Colors.grey[100],
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        MultiSelectFormField(
                          autovalidate: false,
                          titleText: 'My Skills (swipe to more)',

                          validator: (value) {
                            if (value == null || value.length == 0) {
                              return 'Please select one or more skills';
                            }
                          },
                          dataSource: [
                            {
                              "display": "Web development",
                              "value": "Web development",
                            },
                            {
                              "display": "Mobile development",
                              "value": "Mobile development",
                            },
                            {
                              "display": "Data science",
                              "value": "Data science",
                            },
                            {
                              "display": "Software development",
                              "value": "Software development",
                            },
                            {
                              "display": "Block chain",
                              "value": "Block chain",
                            },
                            {
                              "display": "Machine learning",
                              "value": "Machine learning",
                            },
                            {
                              "display": "Natural language processing",
                              "value": "Natural language processing",
                            },
                            {
                              "display": "Digital marketing",
                              "value": "Digital marketing",
                            },
                            {
                              "display": "Multimedia designing",
                              "value": "Multimedia designing",
                            },
                            {
                              "display": "Robotics",
                              "value": "Robotics",
                            },
                          ],
                          textField: 'display',
                          valueField: 'value',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCEL',
                          // required: true,
                          hintText: 'Please choose one or more',

                          value: mySkills,
                          onSaved: (value) {
                            if (value == null) return;
                            setState(() {
                              mySkills=value;
                            });
                          },
                        ),
                        // SizedBox(
                        //   width: 200,
                        //   child: RaisedButton(
                        //     color: Colors.indigo,
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(15)),
                        //     padding: const EdgeInsets.symmetric(horizontal: 40),
                        //     textColor: Colors.white,
                        //     onPressed:
                        //         // () {
                        //         //   CustomDialog(
                        //         //     buttonText: 'ok',
                        //         //     description: 'iii',
                        //         //     title: 'amo',
                        //         //   );
                        //         // },
                        //         _saveForm,
                        //     child: new Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: <Widget>[
                        //         //new Text('Button with text and icon!'),
                        //         //new Icon(Icons.save),
                        //         Text(
                        //           'Save skills!',
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 18),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        MultiSelectFormField(
                          autovalidate: false,
                          titleText: 'Technologies (swipe to more)',

                          validator: (value) {
                            if (value == null || value.length == 0) {
                              return 'Please select one or more technologies';
                            }
                          },
                          dataSource: [
                            {
                              "display": "C",
                              "value": "C",
                            },
                            {
                              "display": "Java",
                              "value": "Java",
                            },
                            {
                              "display": "Python",
                              "value": "Python",
                            },
                            {
                              "display": "C++",
                              "value": "C++",
                            },
                            {
                              "display": "JavaScript",
                              "value": "JavaScript",
                            },
                            {
                              "display": "Ruby",
                              "value": "Ruby",
                            },
                            {
                              "display": "Swift",
                              "value": "Swift",
                            },
                            {
                              "display": "React/React native",
                              "value": "React/React native",
                            },
                            {
                              "display": "C#",
                              "value": "C#",
                            },
                            {
                              "display": "Spring/Struts/JHipster-Java Track",
                              "value": "Spring/Struts/JHipster-Java Track",
                            },
                            {
                              "display": "DotNet/DotNet Core-Microsoft Track",
                              "value": "DotNet/DotNet Core-Microsoft Track",
                            },
                            {
                              "display": "Laravel/Slim/Yll-PHP Track",
                              "value": "Laravel/Slim/Yll-PHP Track",
                            },
                            {
                              "display": "Mean Stack-JS Track",
                              "value": "Mean Stack-JS Track",
                            },
                            {
                              "display": "Firebase",
                              "value": "Firebase",
                            },
                            {
                              "display": "Android",
                              "value": "Android",
                            },
                            {
                              "display": "iOS",
                              "value": "iOS",
                            },
                          ],
                          textField: 'display',
                          valueField: 'value',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCEL',
                          // required: true,
                          hintText: 'Please choose one or more',

                          value: myTechnologies,
                          onSaved: (value) {
                            if (value == null) return;
                            setState(() {
                              myTechnologies = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 200,
                  child: RaisedButton(
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    textColor: Colors.white,
                    onPressed: _saveForm,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        //new Text('Button with text and icon!'),
                        //new Icon(Icons.save),
                        Text(
                          'Save!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(16),
                //   child: Text(_myActivitiesResult),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
