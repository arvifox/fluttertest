import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class AdvertSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60.0,
        horizontal: 20.0,
      ),
      color: Color(0xFFFFAA88),
      child: _SplashImage(),
    );
  }
}

class _SplashImage extends StatefulWidget {
  _SplashImage({Key key}) : super(key: key);

  @override
  _SplashImageState createState() => _SplashImageState();
}

class _SplashImageState extends State<_SplashImage> {
  _afterSplash() {
    Route route =
        MaterialPageRoute(builder: (context) => AdvertMain(title: "sldkf"));
    Navigator.of(context).pushReplacement(route);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("resources/images/splash_image.png");
  }

  @override
  void initState() {
    super.initState();
    _loadData(_afterSplash);
  }

  void _loadData(ff) async {
//    await Timer(Duration(seconds: 6), () {});
//    String dataURL = "http://www.mail.ru";
//    http.Response response = await http.get(dataURL);
    await Future.delayed(const Duration(seconds: 4), () {});
    ff();
  }
}
