import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'package:image_cropper/image_cropper.dart';
import 'package:udevs/login_screen.dart';

class ClientPP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientPPState();
  }
}

class _ClientPPState extends State<ClientPP> {
  File _imageFile;
// Future<Null> _cropImage(File imageFile) async {
//     File croppedFile = await ImageCropper.cropImage(
//       sourcePath: imageFile.path,
//       ratioX: 1.0,
//       ratioY: 1.0,
//       maxWidth: 512,
//       maxHeight: 512,
//     );
// }
  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _imageFile = image;
      });
      // _cropImage(_imageFile);
      Navigator.pop(context);
    });
  }

  void _loginform() {
   // Navigator.pushReplacementNamed(context, '/login');
   Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()));

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

  @override
  Widget build(BuildContext context) {
    final buttonColor = Colors.white;
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert a Profile Picture'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [const Color(0xFF303030), const Color(0xFF757575)],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _imageFile == null
                    ? new Container(
                  height: 160.0,
                  width: 160.0,
                  decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      image: new ExactAssetImage("assets/photo_camera.png"),
                      fit: BoxFit.scaleDown,
                    ),
                    border:
                        Border.all(color: Colors.red, width: 5.0),
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(80.0)),
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
                        Border.all(color: Colors.red, width: 5.0),
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(80.0)),
                  ),
                ),
                SizedBox(height: 10.0),
                OutlineButton(
                  borderSide: BorderSide(color: buttonColor, width: 2.0),
                  onPressed: () {
                    _openImagePicker(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.camera_alt,
                        color: buttonColor,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Add Profile Picture',
                        style: TextStyle(color: buttonColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  textColor: Colors.white,
                  onPressed: _loginform,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //new Text('Button with text and icon!'),
                      new Icon(Icons.lock_open),
                      Text('Register'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
