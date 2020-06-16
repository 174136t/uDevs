import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udevs/Client/clienthometab.dart';
import 'package:udevs/Client/clientNotification.dart';
import 'dart:io';
import 'package:udevs/Client/clientprofiletab.dart';
import 'package:udevs/Client/editCliProfile.dart';
import 'package:udevs/aboutUs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
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
                    // Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => LoginScreen()
                    //             )
                    //             );
                    saveLogout();
                    print('successfully logout');
                    Navigator.pushReplacementNamed(context, "/login");
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
            dialogBackgroundColor: Colors.grey[100],
            backgroundColor: Colors.white),
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
    // textStyle() {
    //   return new TextStyle(color: Colors.black, fontSize: 30.0);
    // }

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            //  key: scaffoldKey,
            drawer: Drawer(
                child: Container(
              color: Colors.grey[100],
              child: ListView(
                children: <Widget>[
                  /* AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),*/
                  new UserAccountsDrawerHeader(
                    accountName: new Text('Join us.Achive best.'),
                    accountEmail:
                        new Text('Find the best freelancers which suits you'),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: new ExactAssetImage("assets/abc.jpeg"),
                      minRadius: 30,
                      maxRadius: 60,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Edit profile'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditClientprofile()));
                    },
                  ),
 
                  // ListTile(
                  //   leading: Icon(Icons.chat),
                  //   title: Text('Respond to requests'),
                  //   onTap: () {},
                  // ),
                  // ListTile(
                  //   leading: Icon(Icons.money_off),
                  //   title: Text('Put bid'),
                  //   onTap: () {},
                  // ),
                  ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('View feedbacks'),
                    onTap: () {},
                  ),
 
                  // ListTile(
                  //   leading: Icon(Icons.settings),
                  //   title: Text('Settings'),
                  //   onTap: () {},
                  // ),
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
              // leading: _isSearching ? const BackButton() : null,
              title: _buildTitle(context),
              // actions: _buildActions(),
              // title: Text('uDevs'),
              backgroundColor: Colors.deepPurple,
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
                  // new Text(
                  //   '$searchQuery',
                  //   style: Theme.of(context).textTheme.display1,
                  // ),
                  Expanded(
                    child: new TabBarView(
                      children: <Widget>[
                        ClientHomeScreen(),
                        ClientProfileScreen(),
                        ClientNotifyScreen(),
                        //RatingBar(
                      ],
                    ),
                  ),

                  // child:
                ],
              ),
            ),
          )),
    );
  }
}
