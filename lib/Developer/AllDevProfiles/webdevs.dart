import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
//import 'package:udevs/devhometab.dart';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'package:udevs/Client/SelectedProfiles/webdev.dart';
import 'package:udevs/models/user.dart';
//import 'package:udevs/Developer/devloperhome.dart';
import 'dart:convert';


class WebDevelopers extends StatefulWidget {
  // final Developers Developers;
//final List<Developers> Developers =[];
  // WebDevelopers(this.Developers);
  @override
  _WebDevelopersState createState() => _WebDevelopersState();
}
 
class _WebDevelopersState extends State<WebDevelopers> {
 //final String url = "http://192.168.1.100:3000/users/project/viewProject";
  final String url = "http://192.168.1.8:3000/users/cli_home/webDeveloper";
  int a=0;
Future<List<User>> _fetchWebProjects() async {
    var data = await http.get(url);
    var jsonData = json.decode(data.body);
    print(data.body);
    print("web list");
    List<User> projects = [];
    for (var p in jsonData) {
      User project = User(
          p["user_ID"],
          p['user']["first_name"],
          p['user']["last_name"],
          p['user']["user_type"],
          p['user']["email"],
          p['user']["password"],
          p['user']["gender"],
           p['user']["contact_no"],
          p['user']['rating'],
          p['createdAt'],
          p['user']['profile_img']);
      projects.add(project);
    }
    print(projects.length);
    return projects;
  }
 
   Widget _webtext() {
    return new Center(
      child: Text(
        "Web development",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
     // backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('uDevs'),
        centerTitle: true,
       // automaticallyImplyLeading: false,
      ),
      body: Container(
            height: deviceHeight,
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [const Color(0xFFD1C4E9), const Color(0xFFB2DFDB)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
              color: Colors.grey[100],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                _webtext(),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: _fetchWebProjects(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    print("web");
                    if (snapshot?.data?.isEmpty??true) {
                      return Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              SizedBox(height: 10,),
                              Text("loadng"),
                            ],
                          ),
                        ),
                      );
                    }

                    return new Expanded(
                        child: new Container(
                          padding: EdgeInsets.all(10),
                            //  color: Colors.white,
                            // width: deviceWidth,
                            // child:new Text("Web Projects"),
                            // height: a < 4 ? deviceHeight : deviceHeight * 0.5 * this.a,
                            child: new ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),

                      //scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int id) {
                        return SingleChildScrollView(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Webdev(snapshot.data[id])),
                              );
                            },
                            child: SingleChildScrollView(
                              child: Card(
                                elevation: 5,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 2,
                                      ),
                                      new CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            //snapshot.data[id].imagename
                                            "http://192.168.1.8:3000/default.png"),
                                      ),
                                      new SizedBox(
                                        height: 10,
                                      ),
                                      // new Text(
                                      //   snapshot.data[id].projectname,
                                      //   style: TextStyle(
                                      //       fontStyle: FontStyle.italic,
                                      //       fontSize: 16,
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                      new Text(
                                            snapshot.data[id].firstname +
                                            " " +
                                            snapshot.data[id].lastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new StarRating(
                                          size: 25.0,
                                          rating: (snapshot.data[id].rating).toDouble(),
                                          color: Colors.deepPurple,
                                          borderColor: Colors.deepPurple,
                                          starCount: 5,
                                          onRatingChanged: (rating) => setState(
                                            () {
                                              //this.rating = rating;
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                //  ),
                                //color: Colors.blue[50],
                              ),
                            ),
                          ),
                        );
                      },
                    )));
                    //);
                  },
                ),
              ],
            )));
  }
}
