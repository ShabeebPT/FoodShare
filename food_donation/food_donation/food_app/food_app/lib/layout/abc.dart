import 'package:flutter/material.dart';
import 'package:food_app/layout/bbb.dart';
import 'package:food_app/layout/bot_recipient.dart';
import 'package:food_app/layout/bot_user.dart';
import 'package:food_app/layout/bot_volunteer.dart';
import 'package:food_app/layout/draw_donor.dart';
import 'package:food_app/layout/draw_volunteer.dart';
import 'package:food_app/layout/login.dart';
import 'package:food_app/layout/view_map_recipient.dart';
import 'package:food_app/layout/webview.dart';
import 'package:http/http.dart';
import 'dart:convert';

class aaaaaa extends StatefulWidget {
  // const view_map({super.key});
  const aaaaaa({Key? key}) : super(key: key);
  @override
  State<aaaaaa> createState() => _aaaaaaState();
}
class _aaaaaaState extends State<aaaaaa> {

  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"user_reg/kkkkk/");
    Response resp1 = await get(url);
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
      drawer: draw_donor(),
      bottomNavigationBar: botnav_donor(),
      appBar: AppBar(
          backgroundColor: Colors.blue),
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
                              new Text(('Recipient Name:' )+" "+data[index]['user_name'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new Text(('Recipient PhoneNo:' )+" "+data[index]['ph_no'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              Container(
                                width: 150,
                                height: 60,
                                padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: (){
                                    // postdata(data[index]['ambulance_id'].toString());
                                    // livechat_doc.usid=data[index]['ambulance'].toString();
                                    dd.aid=data[index]['r_id'].toString();
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => dd()));
                                  },
                                  child: Text("Map",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                ),
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

