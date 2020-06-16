import 'dart:convert';
//import 'package:flutter_web_view/flutter_web_view.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Client/editCliProfile.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
class ClientProfileScreen extends StatefulWidget {
  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  File _imageFile;
  File _pickedImage;
  String name;
  final feedbackTextController = TextEditingController();
  final String url = "http://192.168.1.8:3000/users/profile";
  //String token;

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 300.0).then((File image) {
      setState(() {
        _imageFile = image;
      });
      // _cropImage(_imageFile);
      Navigator.pop(context);
    });
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
  Future<Profile> _fetchProfile() async {
    Profile fetchpro;
    print('frtching');
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
    name=fetchpro.image;
    print(fetchpro.firstname);
    return fetchpro;
  }
  Future<List<Profile>> _fetchimg() async {
    Profile fetchp;
  final String url1 = "http://192.168.1.8:3000/users/sendID";
    print('fetchingiiiiiiiiiiiiiiiiiiiiiiiiiii');
   
    name=fetchp.image;
    int uid = fetchp.id;
    var body = {
      'user_ID': '$uid',
      'image_name': "$name",
    };
    var data = await http.post(url1, body: body);
    var jsonData = json.decode(data.body);
    print('ffffffffffffffffffffffff');
    print(jsonData);
     List<Profile> techs = [];
    // for (var d in jsonData) {
    //   Profile tech = Profile(d["id"], d["developer_ID"], d['user']['first_name'],
    //       d['user']['last_name'], d['user']['rating']);
    //   techs.add(tech);
    // }
    print("11111111111");
    print(techs.length);
    return techs;
  }
  @override
  void initState() {
    //setState(() {
     _fetchimg(); 
   // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;

    return Scaffold(
        // floatingActionButton: FloatingActionButton.extended(
        //   label: Text("Chat",style: TextStyle(fontWeight: FontWeight.bold),),
        //   icon: Icon(Icons.chat),
        //   backgroundColor: Colors.deepOrange,
        //   onPressed:
        //     launchWebViewExample,
        // ),
        backgroundColor: Colors.deepPurple,
        body: Container(
          decoration: BoxDecoration(
              // gradient: new LinearGradient(
              //   colors: [const Color(0xFFD1C4E9), const Color(0xFFB2DFDB)],
              //   begin: FractionalOffset.topCenter,
              //   end: FractionalOffset.bottomCenter,
              // ),
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(230.0))),
          child: SingleChildScrollView(
            child: Container(
              height: deviceHeight,
              width: targetWidth,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                ?
                                 new Container(
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
                                        image:
                                            new ExactAssetImage("assets/images.png"),
                                        fit: BoxFit.scaleDown,
                                      ),
                                      border:
                                          Border.all(color: Colors.black, width: 3.0),
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
                                        image: new ExactAssetImage(_imageFile.path),
                                        fit: BoxFit.fitWidth,
                                      ),
                                      border:
                                          Border.all(color: Colors.black, width: 3.0),
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
                                      return new Container(
                                        // color: Colors.white,
                                        width: deviceWidth * 0.5,
                                        child: GestureDetector(
                                          onTap: () {
                                           
                                          },
                                          child: new Container(
                                            // color: Colors.grey[100],
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
                  SizedBox(
                    height: 12.0,
                  ),
                  
                  new Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
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
          mainAxisAlignment: MainAxisAlignment.start,
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
            MaterialPageRoute(builder: (context) => EditClientprofile()),
          );
        },
        child: new Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  String image;
  Profile(this.id, this.firstname, this.lastname, this.usertype, this.email,
      this.password, this.gender, this.contactno, this.rating, this.creat,this.image);

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
    this.image=map['profile_img'];
  }
}
