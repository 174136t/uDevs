// import 'package:flutter/material.dart';
// //import 'package:flutter_web_view/flutter_web_view.dart';

// class WebPage extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<WebPage> {
//   // String _redirectedToUrl;
//   // FlutterWebView flutterWebView = new FlutterWebView();
//   // bool _isLoading = false;

//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget leading;
//     if (_isLoading) {
//       leading = new CircularProgressIndicator();
//     }
//     var columnItems = <Widget>[
//       new MaterialButton(
//           onPressed: launchWebViewExample, child: new Text("Launch"))
//     ];
//     if (_redirectedToUrl != null) {
//       columnItems.add(new Text("Redirected to $_redirectedToUrl"));
//     }
//     var app = new MaterialApp(
//       home: new Scaffold(
        
//         body: new Column(
//           children: columnItems,
//         ),
//       ),
//     );
//     return app;
//   }

//   void launchWebViewExample() {
//     if (flutterWebView.isLaunched) {
//       return;
//     }

//     flutterWebView.launch("https://google.com",
//         headers: {
//           "X-SOME-HEADER": "MyCustomHeader",
//         },
//         javaScriptEnabled: true,
//         toolbarActions: [
//           new ToolbarAction("Dismiss", 1),
//           new ToolbarAction("Reload", 2)
//         ],
//         barColor: Colors.green,
//         tintColor: Colors.white);
//     flutterWebView.onToolbarAction.listen((identifier) {
//       switch (identifier) {
//         case 1:
//           flutterWebView.dismiss();
//           break;
//         case 2:
//           reload();
//           break;
//       }
//     });
//     flutterWebView.listenForRedirect("mobile://test.com", true);

//     flutterWebView.onWebViewDidStartLoading.listen((url) {
//       setState(() => _isLoading = true);
//     });
//     flutterWebView.onWebViewDidLoad.listen((url) {
//       setState(() => _isLoading = false);
//     });
//     flutterWebView.onRedirect.listen((url) {
//       flutterWebView.dismiss();
//       setState(() => _redirectedToUrl = url);
//     });
//   }

//   void reload() {
//     flutterWebView.load(
//       "https://google.com",
//       headers: {
//         "X-SOME-HEADER": "MyCustomHeader",
//       },
//     );
//   }
// }