import 'package:flutter/widgets.dart';

class AdvertSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 60.0,
        horizontal: 20.0,
      ),
      color: Color(0xFFFFAA88),
      child: Image.asset("resources/images/splash_image.png"),
    );
  }
}
