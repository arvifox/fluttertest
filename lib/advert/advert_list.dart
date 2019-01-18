import 'package:flutter/material.dart';
import 'package:xml/xml.dart' as xml;
import 'package:http/http.dart' as http;

class AdvertList extends StatefulWidget {
  AdvertList({Key key}) : super(key: key);

  @override
  _AdvertListState createState() => _AdvertListState();
}

class _AdvertListState extends State<AdvertList> {
  List ads = [];

  @override
  Widget build(BuildContext context) {
    return Text("size=" + ads.length.toString());
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
      xml.XmlDocument body = xml.parse(response.body);
      var d = body.findAllElements("item");
      var f =
          d.map((no) => _AnAdvert.title(no.findElements("title").single.text));
      setState(() {
        ads = f.toList();
      });
    }
  }
}

class _AnAdvert {
  String title;
  String desc;

  _AnAdvert(this.title, this.desc);

  _AnAdvert.title(String title) : this(title, "");
}
