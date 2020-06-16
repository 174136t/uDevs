// import 'package:flutter/material.dart';
// import 'devhometab.dart';
// import 'dart:async';
// import 'package:http/http.dart'as http;
// import 'dart:convert';
// import 'devloperhome.dart';

// class Project extends StatefulWidget {
//   @override
//   _ProjectState createState() => _ProjectState();
// }
 
// class _ProjectState extends State<Project> {
//  //final String url = "http://192.168.1.100:3000/users/project/viewProject";
//   final String url = "http://192.168.1.100:3000/users/dev_home/webProject";
//     final String url1 = "http://192.168.1.100:3000/users/dev_home/designProject";

// Future<List<Projects>> _fetchWebProjects() async {
//     var data = await http.get(url);
//     var jsonData = json.decode(data.body);
//     print("pppppppppppppppppprrrr");
//     List<Projects> projects = [];
//     for (var p in jsonData) {
//       Projects project = Projects(
//           p["id"],
//           p["project_name"],
//           p["project_category"],
//           p["user"]["first_name"],
//           p["user"]['last_name'],
//           p["payment"],
//           p["period"],
//           p["user"]["image"]["image_name"]);
//       projects.add(project);
//     }
//     print(projects.length);
//     return projects;
//   }
//   Future<List<Projects>> _fetchDesignProjects() async {
//     var data = await http.get(url);
//     var jsonData = json.decode(data.body);
//     print("pppppppppppppppppprrrr");
//     List<Projects> projects = [];
//     for (var p in jsonData) {
//       Projects project = Projects(
//           p["id"],
//           p["project_name"],
//           p["project_category"],
//           p["user"]["first_name"],
//           p["user"]['last_name'],
//           p["payment"],
//           p["period"],
//           p["user"]["image"]["image_name"]);
//       projects.add(project);
//     }
//     print(projects.length);
//     return projects;
//   }
//    Widget _webtext() {
//     return new Center(
//       child: Text(
//         "Web development,IT & Software Skills",
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 18,
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     final double deviceWidth = MediaQuery.of(context).size.width;
//     final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.98;
//     final double deviceHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('uDevs'),
//         centerTitle: true,
//        // automaticallyImplyLeading: false,
//       ),
//       body:SingleChildScrollView(
//       child:Container(
//          width: targetWidth,
//           height: deviceHeight * 1.5,
//           decoration: BoxDecoration(
//             gradient: new LinearGradient(
//               colors: [const Color(0xFFD1C4E9), const Color(0xFFB2DFDB)],
//               begin: FractionalOffset.topCenter,
//               end: FractionalOffset.bottomCenter,
//             ),
//           ),
//           padding: EdgeInsets.all(10.0),
//           child: Center(
//             child: Container(
//                 child: Column(
//               children: <Widget>[
//                 _webtext(),
//                 FutureBuilder(
//                 future: _fetchWebProjects(),
//                 builder: (BuildContext context, AsyncSnapshot snapshot) {
//                   print(snapshot.data);
//                   print("web");
//                   if (snapshot.data == null) {
//                     return Container(
//                       child: Center(
//                         child: Text("loadng"),
//                       ),
//                     );
//                   }

//                   return new Expanded(
//                       child: new Container(
//                           color: Colors.white,
//                           width: deviceWidth,
//                           // child:new Text("Web Projects"),

//                           child: new ListView.builder(
//                            // scrollDirection: Axis.horizontal,
//                             itemCount: snapshot.data.length,
//                             itemBuilder: (BuildContext context, int id) {
//                               return new Container(
//                                 // color: Colors.white,
//                                 width: deviceWidth * 0.5,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                    // Navigator.of(context).pop();

//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => DevHomePage()),
//                                     );
//                                   },
//                                   child: new Card(
//                                     color: Colors.blue[200],
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         new CircleAvatar(
//                                           radius: 30,
//                                           backgroundImage: NetworkImage(
//                                               //snapshot.data[id].imagename
//                                               "https://www.adoreremo.co.uk/wp-content/uploads/2016/06/beautiful-girl-profile-caretofun.net-5.jpg"),
//                                         ),
//                                         new SizedBox(
//                                           height: 15,
//                                         ),
//                                         new Text(
//                                           snapshot.data[id].projectname,
//                                           style: TextStyle(
//                                               fontStyle: FontStyle.italic,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         new Text(
//                                           "by " +
//                                               snapshot
//                                                   .data[id].clientfirstname +
//                                               " " +
//                                               snapshot.data[id].clientlastname,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         new Text(
//                                           snapshot.data[id].payment + " \$",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           )));
//                   //);
//                 },
//               ),
              
//                 SizedBox(
//                   height: 5,
//                 ),
//                // Text('hi'),
//               ],
//             )),
//           )),
//       ),
       
//     );
//   }
// }
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