import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:food_app/layout/login.dart';
class don_loc extends StatefulWidget {
  static var aid;
  const don_loc({Key? key}) : super(key: key);
  @override
  State<don_loc> createState() => _don_locState();
}

class _don_locState extends State<don_loc> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: login.url+"donor_reg/a/"+don_loc.aid,
      appBar: new AppBar(
        title: new Text("Food Donation"),
      ),);
  }
}
