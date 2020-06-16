import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth;
    final double deviceHeight = MediaQuery.of(context).size.height*0.95 ;
    return Scaffold(
        appBar: AppBar(
          title: Text('About us'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: targetWidth,
             height: deviceHeight,
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [const Color(0xFFD1C4E9), const Color(0xFFB2DFDB)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                
                new Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new ExactAssetImage("assets/ajo.jpg"),
                      minRadius: 30,
                      maxRadius: 50,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    new Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Text(
                          " Jayara Thambavita",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "  Team Leader/Software Developer",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                         Text(
                          "   jayarathambavita@gmail.com  ",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                   
                    SizedBox(
                      height: 5.0,
                    ),
                    new Column(
                                     crossAxisAlignment: CrossAxisAlignment.end,

                      children: <Widget>[
                        Text(
                          "Thushan Lakshitha ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " Software Developer  ",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                         Text(
                          "thushanlakshitha97@gmail.com  ",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        
                      ],
                    ), new CircleAvatar(
                      backgroundImage: new ExactAssetImage("assets/thush.jpg"),
                      minRadius: 30,
                      maxRadius: 50,
                    ),
                  ],
                  
                ),
                SizedBox(
                  height: 15.0,
                ),
                new Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new ExactAssetImage("assets/mama.jpg"),
                      minRadius: 30,
                      maxRadius: 50,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    new Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Text(
                          "  Lahiru Neranjan",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "   Software Developer",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "    lahiruneranjan123@gmail.com",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                   
                    SizedBox(
                      height: 5.0,
                    ),
                    new Column(
                                     crossAxisAlignment: CrossAxisAlignment.end,

                      children: <Widget>[
                        Text(
                          "Apsara Kularathna ",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Software Developer  ",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "apsarakularathna@gmail.com  ",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ), new CircleAvatar(
                      backgroundImage: new ExactAssetImage("assets/aps.jpg"),
                      minRadius: 30,
                      maxRadius: 50,
                    ),
                  ],
                  
                ),
                SizedBox(
                  height: 15.0,
                ),
                new Row(
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new ExactAssetImage("assets/thadichchi.png"),
                      minRadius: 30,
                      maxRadius: 50,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    new Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,

                      children: <Widget>[
                        Text(
                          "  Nishadi De Zoyza",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "   Software Developer",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                         Text(
                          "    nishadidesilva@gmail.com  ",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18.0),
              ],
            ),
          ),
        ));
  }
}
