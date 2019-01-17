import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'dart:async';

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
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset("resources/images/splash_image.png");
  }

  @override
  void initState() {
    super.initState();
    _loadData(_afterSplash());
  }

  void _loadData(after()) async {
    Timer(Duration(seconds: 3), () {
      after();
    });
  }
}
