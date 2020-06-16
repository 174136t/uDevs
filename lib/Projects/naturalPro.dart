import 'package:flutter/material.dart';
//import 'package:udevs/devhometab.dart';
import 'dart:async';
import 'package:http/http.dart'as http;
import 'package:udevs/Projects/SelectedProjects/natural.dart';
import 'package:udevs/models/projects.dart';
//import 'package:udevs/Developer/devloperhome.dart';
import 'dart:convert';


class Naturalproject extends StatefulWidget {
  // final Project project;
//final List<Project> project =[];
  // Naturalproject(this.project);
  @override
  _NaturalprojectState createState() => _NaturalprojectState();
}
 
class _NaturalprojectState extends State<Naturalproject> {
 //final String url = "http://192.168.1.100:3000/users/project/viewProject";
  final String url = "http://192.168.1.8:3000/users/dev_home/natlang";
  int a=0;
Future<List<Project>> _fetchNaturalprojects() async {
    var data = await http.get(url);
    var jsonData = json.decode(data.body);
    print("pppppppppppppppppprrrr");
    List<Project> projects = [];
    for (var p in jsonData) {
      Project project = Project(
          p["id"],
          p["project_name"],
          p["project_category"],
          p["project_description"],
          p["user"]["first_name"],
          p["user"]['last_name'],
          p["payment"],
         // p["period"],
          p["user"]["profile_img"],
          p['createdAt'],
          p['user']['createdAt'],
          p['user']['rating']);
      projects.add(project);
    }
    print(projects.length);
    this.a=projects.length;
    return projects;
  }
 
   Widget _webtext() {
    return new Center(
      child: Text(
        "Natural language processing",
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
                  future: _fetchNaturalprojects(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    print(snapshot.data);
                    print("web");
                    if (snapshot.data == null) {
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
                                        Naturalpro(snapshot.data[id])),
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
                                      new Text(
                                        snapshot.data[id].projectname,
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        "by " +
                                            snapshot.data[id].clientfirstname +
                                            " " +
                                            snapshot.data[id].clientlastname,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
snapshot.data[id].payment.isEmpty?'Bid project' :snapshot.data[id].payment+" \$",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 17),
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
// class Projects {
//   final int id;
//   final String projectname;
//   final String projectcategory;
//   final String clientfirstname;
//   final String clientlastname;
//   final String payment;
//   final String period;
//   final String imagename;
//   Projects(
//       this.id,
//       this.projectname,
//       this.projectcategory,
//       this.clientfirstname,
//       this.clientlastname,
//       this.payment,
//       this.period,
//       this.imagename);
// }