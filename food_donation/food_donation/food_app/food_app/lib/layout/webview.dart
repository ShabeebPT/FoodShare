import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:food_app/layout/login.dart';
class webviewtest extends StatefulWidget {
  static var aid;
  const webviewtest({Key? key}) : super(key: key);
  @override
  State<webviewtest> createState() => _webviewtestState();
}

class _webviewtestState extends State<webviewtest> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: login.url+"track/a/"+webviewtest.aid,
      appBar: new AppBar(
        title: new Text("Food Donation"),
      ),);
  }
}
