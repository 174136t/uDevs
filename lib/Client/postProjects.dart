import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Client/clienthome.dart';
import 'package:udevs/models/projects.dart';

class ClientPostProjectscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientPostProjectscreenState();
  }
}

class _ClientPostProjectscreenState extends State<ClientPostProjectscreen>
    with TickerProviderStateMixin {
  // AnimationController _animationController;
  // final Map<String, dynamic> _formData = {
  //   'projectname': null,
  //   'projectdetails': null,
  // };
  //@override
  // void initState() {
  //   _animationController =
  //       new AnimationController(vsync: this, duration: Duration(seconds: 1));
  //   _animationController.repeat();
  //   super.initState();
  // }

  final TextEditingController _payment = new TextEditingController();
  final TextEditingController _bidamount = new TextEditingController();
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String invalidMsg = "";
  String projectdetails;
  String projectname;
  String projectpayment;
  String projectperiod;
  String projectcategory;
  String bidamount;
  int id;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildprojectnameTextField() {
    return Container(
      // height: 50,
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding:
                new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Project name here...',
            filled: true,
            fillColor: Colors.white),
        //  obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return ' Please enter a project name';
          }
        },
        onSaved: (String value) {
          this.projectname = value;
        },
      ),
    );
  }

//String selectedCountry;

  List<DropdownMenuItem<String>> _getCountries() {
    return [
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.language),
              SizedBox(width: 10),
              Text('Web development'),
            ],
          ),
          value: 'Web development'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.phonelink_setup),
              SizedBox(width: 10),
              Text('Mobile development'),
            ],
          ),
          value: 'Mobile development'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.date_range),
              SizedBox(width: 10),
              Text('Data science'),
            ],
          ),
          value: 'Data science'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.data_usage),
              SizedBox(width: 10),
              Text('Software development'),
            ],
          ),
          value: 'Software development'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.web),
              SizedBox(width: 10),
              Text('Block chain'),
            ],
          ),
          value: 'Block chain'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.laptop_chromebook),
              SizedBox(width: 10),
              Text('Machine learning'),
            ],
          ),
          value: 'Machine learning'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.nature_people),
              SizedBox(width: 10),
              Text('Natural language processing'),
            ],
          ),
          value: 'Natural language processing'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.desktop_windows),
              SizedBox(width: 10),
              Text('Digital marketing'),
            ],
          ),
          value: 'Digital marketing'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.library_music),
              SizedBox(width: 10),
              Text('Multimedia designing'),
            ],
          ),
          value: 'Multimedia designing'),
      new DropdownMenuItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 5),
              Icon(Icons.bug_report),
              SizedBox(width: 10),
              Text('Robotics'),
            ],
          ),
          value: 'Robotics'),
    ];
  }

  Widget _buildprojectcategory() {
    return Container(
      //height: 100,
      decoration: new BoxDecoration(
          color: Colors.white,
          //new Color.fromRGBO(255, 0, 0, 0.0),

          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0))),
      // color: Colors.white,
      child: FormField<String>(
        autovalidate: true,
        builder: (FormFieldState<String> countryState) {
          return Column(
            children: <Widget>[
              InputDecorator(
                decoration: InputDecoration(
                    labelText: "   Select a project category",
                    errorText:
                        countryState.hasError ? countryState.errorText : null),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    // value: selectedCountry,
                    items: _getCountries(),
                    //hint: Text("Country"),
                    onChanged: (String value) {
                      setState(() => this.projectcategory = value);
                      countryState.didChange(value);
                    },
                    value: this.projectcategory,
                  ),
                ),
              ),
            ],
          );
        },
        validator: (value) {
          if (value == null) {
            return "You must select a project category";
          }
        },
      ),
    );
  }

  Widget _buildprojectdetailTextField() {
    return Container(
      //height: 50,
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
            contentPadding:
                new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            //labelText: 'describe your project here...',
            hintText: 'Describe your project here...',
            filled: true,
            fillColor: Colors.white),
        //  obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return ' Please enter project details';
          }
        },
        onSaved: (String value) {
          this.projectdetails = value;
        },
      ),
    );
  }

  Widget _buildprojectpaymentTextField() {
    return Container(
      //height: 50,
      width: MediaQuery.of(context).size.width * 0.45,
      child: TextFormField(
        controller: _payment,
        decoration: InputDecoration(
            contentPadding:
                new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'amount in \$... ex:20',
            filled: true,
            fillColor: Colors.white),

        //  obscureText: true,
        validator: (String value) {
          if (_payment.text.isNotEmpty && _bidamount.text.isNotEmpty) {
            return ' Both payment & bid\n can\'t be done at once';
          }
          if (_payment.text.isEmpty && _bidamount.text.isEmpty) {
            return ' Please choose either\n one of above two';
          }
        },
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          this.projectpayment = value;
        },
      ),
    );
  }

  Widget _buildprojectbidTextField() {
    return Container(
      //height: 50,
      width: MediaQuery.of(context).size.width * 0.45,
      child: TextFormField(
        controller: _bidamount,
        decoration: InputDecoration(
            contentPadding:
                new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'max bid in \$... ex:20',
            filled: true,
            fillColor: Colors.white),

        //  obscureText: true,
        validator: (String value) {
          if (_payment.text.isNotEmpty && _bidamount.text.isNotEmpty) {
            return ' Both payment & bid\n can\'t be done at once';
          }
          if (_payment.text.isEmpty && _bidamount.text.isEmpty) {
            return ' Please choose either\n one of above two';
          }
        },
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          this.bidamount = value;
          
        },
      ),
    );
  }

  Widget _buildprojectperiodTextField() {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding:
              new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'ex:3 days/ 2 weeks / 1 month',
          filled: true,
          fillColor: Colors.white),
      //  obscureText: true,
      validator: (String value) {
        if (value.isEmpty) {
          return ' Please enter a time period';
        }
      },
      onSaved: (String value) {
        this.projectperiod = value;
      },
    );
  }

  Widget _buildsubmitbtn() {
    return SizedBox(
        //height: 50,
        width: 150,
        child: RaisedButton(
          // shape: new Border.all(color: Colors.black),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

          color: Colors.indigo,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          textColor: Colors.black,
          splashColor: Colors.orange,
          onPressed: _submitForm,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              //new Text('Button with text and icon!'),
              //  new Icon(Icons.lock_open),
              Text(
                'Submit',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ));
  }

  // Widget _buildattachbtn() {
  //   return SizedBox(
  //     width: 230,
  //     child: RaisedButton(
  //       shape: new Border.all(color: Colors.black),
  //       color: Colors.brown[100],
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       textColor: Colors.black,
  //       splashColor: Colors.blue,
  //       onPressed: () {},
  //       child: new Row(
  //         //mainAxisAlignment: MainAxisAlignment.center,
  //         //  mainAxisSize: MainAxisSize.max,
  //         children: <Widget>[
  //           //new Text('Button with text and icon!'),
  //           new Icon(Icons.add),
  //           Text(
  //             'Upload attachments',
  //             style: TextStyle(fontSize: 20.0),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void _submitForm() {
    if (!_formKey.currentState.validate() ||
        (_payment.text.isNotEmpty && _bidamount.text.isNotEmpty)) {
      return;
    }
    _formKey.currentState.save();
    submitproject();
    // print(_formData);

    // Navigator.pushReplacementNamed(context, '/cpp');
    // Navigator.of(context).pop();
    //  Navigator.push(
    //                                   context,
    //                                   MaterialPageRoute(
    //                                     builder: (context) => HomePage(),
    //                                   ));
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height * 1.3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post new project',
          style: TextStyle(fontSize: 21.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: targetWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [const Color(0xFFD1C4E9), const Color(0xFFB2DFDB)],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(10.0),
        //  child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    'Name of the project :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.0,
                  ),
                  _buildprojectnameTextField(),
                  SizedBox(
                    height: 15.0,
                  ),
                  new Text(
                    'Project category :',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  _buildprojectcategory(),
                  SizedBox(
                    height: 15.0,
                  ),
                  new Text(
                    'Tell us more about the project :',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 3.0),
                  Center(
                    child: new Text(
                      'Start describing bit about yourself or your business,and include the details about what you need to be done as the project.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  _buildprojectdetailTextField(),
                  SizedBox(height: 15.0),
                  // _buildattachbtn(),
                  new Text(
                    '(You can select only one option of below 2, which can be ediited later)',
                    style: TextStyle(
                      fontSize: 10.8,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        '  Payment amount      ',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        'Max Bid amount     ',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(height: 3.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildprojectpaymentTextField(),
                      _buildprojectbidTextField(),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  // new Text(
                  //   'Time period :',
                  //   style:
                  //       TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(height: 3.0),
                  // _buildprojectperiodTextField(),
                  SizedBox(height: 25.0),
                  _buildsubmitbtn(),
                  SizedBox(height: 3.0),
                ],
              ),
            ),
          ),
        ),
        //),
      ),
    );
  }

  // void submitbid() async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   // id = prefs.getInt('id');

  //   //print(id);
  //   //int getid = await prefs.getInt("LastUserId");
  //   var url = 'http://192.168.1.8:3000/users/project/startBid';

  //   var body = {
  //     'project_ID': '$id',
  //     'maximum_value': "$bidamount",
  //     'start_date': "$projectcategory",
  //     //'project_description': "$projectdetails",
  //     //'payment': "$projectpayment",
  //     //'period': "$projectperiod",
  //     //'isShowed': "1"
  //   };

  //   http.post(url, body: body).then((http.Response response) {
  //     // print("***********");
  //     // print(response.body);
  //     // print('${response.statusCode}');
  //     Map<String, dynamic> res = json.decode(response.body);

  //     if (res['success'] == 1) {
  //       //_showSnacksBar();
  //       //buildLoadingDialog();
  //       _showDialog();
  //     }
  //   });
  // }

  void submitproject() async {
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getInt('id');

    print(id);
    //int getid = await prefs.getInt("LastUserId");
    var url = 'http://192.168.1.8:3000/users/project/addProject';

    var body = {
      'client_ID': '$id',
      'project_name': "$projectname",
      'project_category': "$projectcategory",
      'project_description': "$projectdetails",
      'payment': "$projectpayment",
      //'period': "$projectperiod",
      'isShowed': "1"
    };
    Project fetch;
    http.post(url, body: body).then((http.Response response) {
      print("**********************************************************");
      print(response.body);
      var jsonD = json.decode(response.body);
      fetch = Project.fromMap(jsonD);
      print(fetch.createdAt);
      print(fetch.id);
      int cliid = fetch.id;
      String dat = fetch.createdAt;
      // print('${response.statusCode}');
      Map<String, dynamic> res = json.decode(response.body);
      if (res['success'] == 1 && projectpayment.isNotEmpty) {
        _showDialog();
      }
      else if (projectpayment.isEmpty && res['success'] == 1) {
        //_showSnacksBar();
        //submitbid();
        var url1 = 'http://192.168.1.8:3000/users/project/startBid';

        var body = {
          'project_ID': '$cliid',
          'maximum_value': "$bidamount",
          'start_date': "$dat",
          //'project_description': "$projectdetails",
          //'payment': "$projectpayment",
          //'period': "$projectperiod",
          //'isShowed': "1"
        };

        http.post(url1, body: body).then((http.Response response) {
          // print("***********");
          // print(response.body);
          // print('${response.statusCode}');
          Map<String, dynamic> res = json.decode(response.body);

          if (response.statusCode == 200) {
            //_showSnacksBar();
            //buildLoadingDialog();
            //_showDialog();
            return;
          }
        });
        _showDialog();
      } else {
        Navigator.of(context).pop();
        //invalidAuth();
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
          title: new Text("Project has been posted successfully."),
          // content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Got it"),
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
  //_showSnacksBar() {
  //   final snackBar = SnackBar(
  //     content: Text(
  //       "Project successfully posted!",
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     duration: Duration(seconds: 3),
  //     backgroundColor: Colors.blueGrey,
  //   );
  //   _scaffoldKey.currentState.showSnackBar(snackBar);
  // }

  // void invalidAuth() {
  //   setState(() {
  //     this.invalidMsg = "This user already exists!";
  //     _showSnackBar(invalidMsg);
  //     _formKey.currentState.reset();
  //   });
  // }

  // _showSnackBar(String invalidMsg) {
  //   final snackBar = SnackBar(
  //     content: Text(
  //       invalidMsg,
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     duration: Duration(seconds: 3),
  //     backgroundColor: Colors.blueGrey,
  //   );
  //   _scaffoldKey.currentState.showSnackBar(snackBar);
  // }

  Widget buildLoadingDialog() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          //leading: CircularProgressIndicator(),
          title: Text('Loading...'),
        ),
      ),
    );
  }
}
