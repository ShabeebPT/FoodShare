import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/layout/bot_recipient.dart';
import 'package:food_app/layout/bot_volunteer.dart';
import 'package:food_app/layout/draw_recipient.dart';
import 'package:food_app/layout/draw_volunteer.dart';
import 'package:food_app/layout/login.dart';
import 'package:http/http.dart';
import 'dart:convert';
class view_reply extends StatefulWidget {
  // const v_avail({super.key});
  const view_reply({Key? key}) : super(key: key);

  @override
  State<view_reply> createState() => _view_replyState();
}

class _view_replyState extends State<view_reply> {

  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"complaint/view_replay/");
    Response resp1 = await post(url,body: {
      'uid':login.uid
    });
    data = jsonDecode(resp1.body);
    this.setState(() {
    });
    print(resp1.body);
  }
  @override
  void initState() {
    List_function();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      drawer: draw_volunteer(),
      bottomNavigationBar: botnav_volunteer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,title: Text('Food Donation'),),
      body:
      Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.horizontal(),
            color: Colors.white,
          ),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here

                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // Image.network(mainpage.url+"static/"+data[index]['pmr'].toString()),
                              new Text(('Complaint : ' )+" "+data[index]['complaint_details'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new Text(('Reply : ' )+" "+data[index]['reply'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}

