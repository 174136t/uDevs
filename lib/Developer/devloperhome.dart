import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Developer/devhometab.dart';
import 'package:udevs/Developer/devNotificationtab.dart';
import 'package:udevs/Developer/devprofiletab.dart';
import 'package:udevs/Developer/editprofile.dart';
//import 'package:udevs/functions/saveLogout.dart';
import 'dart:io';
import 'package:udevs/login_screen.dart';
import '../aboutUs.dart';
//import 'devLogin.dart';

class DevHomePage extends StatefulWidget {
  @override
  _DevHomePageState createState() => new _DevHomePageState();
}

class _DevHomePageState extends State<DevHomePage>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
  DateTime currentBackPressTime = DateTime.now();

 

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
        Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      // onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            const Text(
              '       uDevs',
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }

  

  saveLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id');
    prefs.remove('email');
    prefs.remove('token');
    prefs.remove('userType');
  }

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => new Theme(
            data: Theme.of(context).copyWith(
                dialogBackgroundColor: Colors.grey[100],
                backgroundColor: Colors.white),
            child: AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to log out from this account?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    saveLogout();
                    print('successfully logout');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
              ],
            )));
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2))
      currentBackPressTime = now;
    return showDialog(
      context: context,
      builder: (context) => new Theme(
        data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white, backgroundColor: Colors.white),
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
   return new WillPopScope(
        onWillPop: _onWillPop,
        child: DefaultTabController(
          length: 3,
          child: new Scaffold(
            //  key: scaffoldKey,
            drawer: Drawer(
                child: Container(
              color: Colors.white,
            
              child: ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text('Join us.Achive best.'),
                    accountEmail:
                        new Text('Find the best jobs which suits your passion'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: new ExactAssetImage("assets/abc.jpeg"),
                    //  minRadius: 30,
                     // maxRadius: 60,
                      radius: 0,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Edit profile'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editprofile()));
                    },
                  ),
                 
                  ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('View feedbacks'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help'),
                    onTap: () {},
                  ),
                  
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About us'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsScreen()));
                    },
                  ),
                  
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Log out'),
                    onTap: () => _showWarningDialog(context),
                  ),
                ],
              ),
            )),

            appBar: new AppBar(
              elevation: 10,
              backgroundColor: Colors.deepPurple,
              title:  _buildTitle(context),
              
              bottom: new TabBar(
          indicatorColor: Colors.deepOrange,

                tabs: <Widget>[
                  
                  new Tab(
                    
                    icon: new Icon(Icons.home),
                  ),
                  new Tab(
                    icon: new Icon(Icons.person),
                  ),
                  new Tab(
                    icon: new Icon(Icons.notifications),
                  ),
                  
                ],
              ),
            ),

            body: new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                
                  Expanded(
                    child: new TabBarView(
                      children: <Widget>[
                        DevHomeScreen(

                        ),
                        DevProfileScreen(),
                        DevNotifyScreen(),
                        //DevMsgScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
