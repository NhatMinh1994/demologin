import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_login/ui/captureImage/utils/ImagePickerHandler.dart';
import 'package:flutter_login/ui/captureImage/utils/ImagePickerDialog.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CaptureImageScreen extends StatefulWidget {
  CaptureImageScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CaptureImageScreenState createState() => new _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen>
    with TickerProviderStateMixin,ImagePickerListener{

  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker=new ImagePickerHandler(this,_controller);
    imagePicker.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title,
//          style: new TextStyle(
//              color: Colors.white
//          ),
//        ),
//      ),
      body: new GestureDetector(
        onTap: () => imagePicker.showDialog(context),
        child: new Center(
          child: _image == null
              ? new Stack(
            children: <Widget>[

              new Center(
                child: new CircleAvatar(
                  radius: 80.0,
                  backgroundColor: const Color(0xFF778899),
                ),
              ),
              new Center(
                child: new Image.asset("images/profile.png"),
              ),
            ],
          )
              : new Column(
            children: <Widget>[
          Image.file(
          File(_image.path),
            width: 300,
            height: 300,
          ),
              new Container(
                height: 160.0,
                width: 160.0,
                decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: new ExactAssetImage(_image.path),
                    fit: BoxFit.cover,
                  ),
                  border:
                  Border.all(color: Colors.red, width: 5.0),
                  borderRadius:
                  new BorderRadius.all(const Radius.circular(80.0)),
                ),

              ),
            ],
          )
        ),
      ),

    );
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
  }
}