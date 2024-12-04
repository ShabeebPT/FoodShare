import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:food_app/layout/login.dart';
class live_loc extends StatefulWidget {
  static var aid;
  const live_loc({Key? key}) : super(key: key);
  @override
  State<live_loc> createState() => _live_locState();
}

class _live_locState extends State<live_loc> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: login.url+"donor_reg/b/"+live_loc.aid,
      appBar: new AppBar(
        title: new Text("Food Donation"),
      ),);
  }
}
