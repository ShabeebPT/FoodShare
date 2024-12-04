import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/layout/bot_recipient.dart';
import 'package:food_app/layout/bot_volunteer.dart';
import 'package:food_app/layout/draw_recipient.dart';
import 'package:food_app/layout/draw_volunteer.dart';
import 'package:food_app/layout/login.dart';
import 'package:http/http.dart';
import 'dart:convert';
class view_donation_volunteer extends StatefulWidget {
  // const v_avail({super.key});
  const view_donation_volunteer({Key? key}) : super(key: key);

  @override
  State<view_donation_volunteer> createState() => _view_donation_volunteerState();
}

class _view_donation_volunteerState extends State<view_donation_volunteer> {

  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"donation_details/view_vol/");
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
                              new Text(('Donor Name : ' )+" "+data[index]['dname'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new Text(('User Name : ' )+" "+data[index]['rname'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new Text(('Donation Details : ' )+" "+data[index]['donation_details'].toString(), style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new Text(('Address : ' )+" "+data[index]['address'], style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),

                              new Text((' Date: ' )+""+data[index]['date'], style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new Text((' Time: ' )+" "+data[index]['time'], style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                              ),
                              new Text(('Status : ' )+" "+data[index]['status'].toString(), style: Theme
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

