import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdvertList extends StatefulWidget {
  AdvertList({Key key}) : super(key: key);

  @override
  _AdvertListState createState() => _AdvertListState();
}

class _AdvertListState extends State<AdvertList> {
  List<_AnAdvert> ads = [];
  List<Widget> ads_widget = [];

  @override
  Widget build(BuildContext context) {
    return ListView(children: ads_widget);
  }

  @override
  void initState() {
    super.initState();
    _loadAdvert();
  }

  void _loadAdvert() async {
    http.Response response = await http.get(
        "https://www.hibiny.com/iphone/board.php?articles_per_page=10&from=0&full=1");
    if (response.statusCode == 200) {
      xml.XmlDocument body = xml.parse(utf8.decode(response.bodyBytes));
      var d = body.findAllElements("item");
      var f =
          d.map((no) => _AnAdvert.title(no.findElements("title").single.text));
      ads = f.toList();
      _reloadWidgets();
    }
  }

  void _reloadWidgets() {
    setState(() {
      ads_widget.clear();
      for (var i = 0; i < ads.length; i++) {
        ads_widget.add(_getRow(i));
      }
      ads_widget = List.from(ads_widget);
    });
  }

  Widget _getRow(int i) {
    return GestureDetector(
      child: Padding(padding: EdgeInsets.all(2.0), child: Text(ads[i].title)),
      onTap: () {
        print("print");
      },
    );
  }
}

class _AnAdvert {
  String title;
  String desc;

  _AnAdvert(this.title, this.desc);

  _AnAdvert.title(String title) : this(title, "");
}
