import 'package:flutter/material.dart';
import 'splash.dart';

class AdvertApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: AdvertSplash(),
    );
  }
}