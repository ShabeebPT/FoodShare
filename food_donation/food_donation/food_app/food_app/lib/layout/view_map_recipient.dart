import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:food_app/layout/login.dart';
class vw_map_rec extends StatefulWidget {
  static var aid;
  const vw_map_rec({Key? key}) : super(key: key);
  @override
  State<vw_map_rec> createState() => _vw_map_recState();
}

class _vw_map_recState extends State<vw_map_rec> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: login.url+"user_reg/a/"+vw_map_rec.aid,
      appBar: new AppBar(
        title: new Text("Food Donation"),
      ),);
  }
}
