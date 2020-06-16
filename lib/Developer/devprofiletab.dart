import 'dart:convert';
//import 'package:flutter_web_view/flutter_web_view.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Developer/editprofile.dart';
//import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:udevs/Developer/skillpage.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
class DevProfileScreen extends StatefulWidget {
  @override
  _DevProfileScreenState createState() => _DevProfileScreenState();
}

class _DevProfileScreenState extends State<DevProfileScreen> {
  // String _redirectedToUrl;
  // FlutterWebView flutterWebView = new FlutterWebView();
  // bool _isLoading = false;
  File _imageFile;
  File _pickedImage;
  final feedbackTextController = TextEditingController();
  final String url = "http://192.168.1.8:3000/users/profile";
  final String url1 = "http://192.168.1.8:3000/users/skillprofile";
  final String url2 = "http://192.168.1.8:3000/users/technoprofile";

  String skills = "No skills yet";
  String tech = "No technologies yet";

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      skills = prefs.getString('skill') ?? "";
      tech = prefs.getString('tech') ?? "";
      if (skills.isEmpty && tech.isEmpty) {
       // _showDialog();
      }
    });
  }

  Future<Profile> _fetchProfile() async {
    //  _read();
    //_showDialog();
    Profile fetchpro;
    print('fetching');
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);
    var data = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: token},
    );
    var jsonData = json.decode(data.body);
    print(jsonData);

    fetchpro = Profile.fromMap(jsonData);
    print('here');
    print(fetchpro.firstname);
    return fetchpro;
  }

  Future<List<Skill>> _fetchskills() async {
    print('fetching skills');
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    print(token);
    var data = await http.get(
      url1,
      headers: {HttpHeaders.authorizationHeader: token},
    );
    var jsonData = json.decode(data.body);
    print(jsonData);
    List<Skill> skills = [];
    for (var d in jsonData) {
      Skill skill = Skill(
        d["skill"],
      );
      skills.add(skill);
    }
    print("^^^^^^^^^^^^^^^^^^^^^^^^^");
    print(skills.length);
    return skills;
  }

  Future<List<Technology>> _fetchtech() async {
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
    List<Technology> techs = [];
    for (var d in jsonData) {
      Technology tech = Technology(
        d["technology"],
      );
      techs.add(tech);
    }
    print("-----------------------");
    print(techs.length);
    return techs;
  }

  // void _showDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (_) => NetworkGiffyDialog(
  //             image: Image.network(
  //               "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
  //               fit: BoxFit.cover,
  //             ),
  //             // imageUrl:"https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
  //             title: Text('Add skills & technologies',
  //                 textAlign: TextAlign.center,
  //                 style:
  //                     TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
  //             description: Text(
  //               'This will help us to find you easily',
  //               textAlign: TextAlign.center,
  //             ),
  //             onOkButtonPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ));
  // }

  @override
  initState() {
    super.initState();

    _read();
  }
// Future<Null> uploadImage(String route, String path) async {
//     final mimeTypeData = lookupMimeType(_pickedImage.path).split('/');
//     final imageUploadRequest =
//     http.MultipartRequest('POST', Uri.parse('$hostUrl$route'));
//     final file = await http.MultipartFile.fromPath(path, _pickedImage.path,
//         contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));
//     imageUploadRequest.files.add(file);
//     try {
//       final streamedResponse = await imageUploadRequest.send();
//       final response = await http.Response.fromStream(streamedResponse);
//       if(response.statusCode != 200 && response.statusCode != 201){
//         print('Something went wrong');
//         print(json.decode(response.body));
//         return null;
//       }
//       final responseData = json.decode(response.body);
//       print(responseData);
//     } catch (error) {
//       print(error);
//       return null;
//     }
//   }


  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;

    return Scaffold(
       
        backgroundColor: Colors.deepPurple,
        body: Container(
          decoration: BoxDecoration(
            
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(230.0))),
          child: SingleChildScrollView(
            child: Container(
              // height: deviceHeight,
              width: targetWidth,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[50],
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: new Row(
                          children: <Widget>[
                            _imageFile == null
                                ? new Container(
                                    height: 170.0,
                                    width: 160.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        _openImagePicker(context);
                                      },
                                    ),
                                    decoration: new BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      image: new DecorationImage(
                                        image: new ExactAssetImage(
                                            "assets/images.png"),
                                        fit: BoxFit.scaleDown,
                                      ),
                                      border: Border.all(
                                          color: Colors.black, width: 1.0),
                                      borderRadius: new BorderRadius.all(
                                          const Radius.circular(80.0)),
                                    ),
                                  )
                                : new Container(
                                    height: 160.0,
                                    width: 160.0,
                                    decoration: new BoxDecoration(
                                      color: const Color(0xff7c94b6),
                                      image: new DecorationImage(
                                        image: new ExactAssetImage(
                                            _imageFile.path),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      
                                      border: Border.all(
                                          color: Colors.black, width: 3.0),
                                      borderRadius: new BorderRadius.all(
                                          const Radius.circular(80.0)),
                                    ),
                                  ),
                            Expanded(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  FutureBuilder<Profile>(
                                    future: _fetchProfile(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.data == null) {
                                        return Container(
                                          child: Column(
                                            children: <Widget>[
                                              Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              Text("Try login again!")
                                            ],
                                          ),
                                        );
                                      }
                                      Profile profile = snapshot.data;
                                      print(profile.firstname);
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: new Container(
                                          //color: Colors.white,
                                          //width: deviceWidth * 0.5,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: new Container(
                                              //color: Colors.grey[100],
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  // new CircleAvatar(
                                                  //   radius: 30,
                                                  //   backgroundImage: NetworkImage(
                                                  //       //snapshot.data[id].imagename
                                                  //       "https://www.adoreremo.co.uk/wp-content/uploads/2016/06/beautiful-girl-profile-caretofun.net-5.jpg"),
                                                  // ),
                                                  new SizedBox(
                                                    height: 15,
                                                  ),
                                                  new Text(
                                                    //
                                                    profile.firstname +
                                                        " " +
                                                        profile.lastname,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text('Star rating:'),
                                                  StarRating(
                                                    size: 25.0,
                                                    rating: (profile.rating)
                                                        .toDouble(),
                                                    color: Colors.deepPurple,
                                                    borderColor:
                                                        Colors.deepPurple,
                                                    starCount: 5,
                                                    onRatingChanged: (rating) =>
                                                        setState(
                                                      () {
                                                        //this.rating = rating;
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  new Text(
                                                    profile.email,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text('Member since:'),
                                                  Text((profile.creat)
                                                      .substring(0, 10))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                      //);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _addphoto(),
                      SizedBox(
                        width: 15,
                      ),
                      _editpro()
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        ' Skills',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      _addskill()
                    ],
                  ),
                  Container(
                    //elevation: 5,
                    height: 45,
                    //color: Colors.deepPurple[50],
                    child: Column(
                      children: <Widget>[
                        FutureBuilder(
                          future: _fetchskills(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            //     print('8888888888888');
                            // print(snapshot.data.length);
                            // print("web");
                            if (snapshot?.data?.isEmpty??true) {
                              return Container(
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      CircularProgressIndicator(),
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
                                              snapshot.data[id].skill,
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
                  Divider(),
                  SizedBox(height: 15.0),
                  new Text(
                    ' Technologies',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    //elevation: 5,
                    height: 45,
                    // color: Colors.deepPurple[50],
                    child: Column(
                      children: <Widget>[
                        FutureBuilder(
                          future: _fetchtech(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            print(snapshot.data);
                            //print("web");
                            if (snapshot?.data?.isEmpty??true) {
                              return Container(
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      CircularProgressIndicator(),
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
                                    //width: deviceWidth / 5,
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
                  Divider(),
                  SizedBox(height: 10.0),
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
        ));
  }
  Widget _addphoto() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      child: OutlineButton(
        //  color: Colors.brown,
        borderSide: BorderSide(
            color: Colors.black, style: BorderStyle.solid, width: 4.0),
        onPressed: () {
          _openImagePicker(context);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.camera_alt,
              //color: buttonColor,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              'Add Profile Picture',
              // style: TextStyle(color: buttonColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _editpro() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.43,
      child: RaisedButton(
        elevation: 5,
        color: Colors.green[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //padding: const EdgeInsets.symmetric(horizontal: 40),
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Editprofile()),
          );
        },
        child: new Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //new Text('Button with text and icon!'),
            new Icon(Icons.edit),
            Text(
              'Edit profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addskill() {
    return SizedBox(
      //width: 140,
      child: RaisedButton(
        elevation: 5,
        color: Colors.red[800],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        //padding: const EdgeInsets.symmetric(horizontal: 40),
        textColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SkillPage()),
          );
        },
        child: new Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //new Text('Button with text and icon!'),
            new Icon(Icons.add),
            Text(
              'Add skills & technologies',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
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

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text(
                'Pick an Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Use Camera'),
                onPressed: () {
                  _getImage(context, ImageSource.camera);
                },
              ),
              FlatButton(
                textColor: Theme.of(context).primaryColor,
                child: Text('Use Gallery'),
                onPressed: () {
                  _getImage(context, ImageSource.gallery);
                },
              )
            ]),
          );
        });
  }

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
      });
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      print(image);
      // _cropImage(_imageFile);
      Navigator.pop(context);
    });
  }
}

class Technology {
  String techno;
  Technology(this.techno);

  Technology.fromMap(Map<String, dynamic> map) {
    this.techno = map['technology'];
  }
}

class Skill {
  String skill;
  Skill(this.skill);

  Skill.fromMap(Map<String, dynamic> map) {
    this.skill = map['skill'];
  }
}

class Profile {
  int id;
  String firstname;
  String lastname;
  String usertype;
  String email;
  String password;
  String gender;
  String contactno;
  int rating;
  String creat;
  
  Profile(this.id, this.firstname, this.lastname, this.usertype, this.email,
      this.password, this.gender, this.contactno, this.rating, this.creat);

  Profile.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.firstname = map["first_name"];
    this.lastname = map["last_name"];
    this.usertype = map["user_type"];
    this.email = map["email"];
    this.password = map["password"];
    this.gender = map["gender"];
    this.contactno = map["contact_no"];
    this.rating = map['rating'];
    this.creat = map['createdAt'];
  }
}
