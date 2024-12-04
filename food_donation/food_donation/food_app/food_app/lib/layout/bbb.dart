import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:food_app/layout/login.dart';
class dd extends StatefulWidget {
  static var aid;
  const dd({Key? key}) : super(key: key);
  @override
  State<dd> createState() => _ddState();
}

class _ddState extends State<dd> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: login.url+"user_reg/b/"+dd.aid,
      appBar: new AppBar(
        title: new Text("Food Donation"),
      ),);
  }
}
