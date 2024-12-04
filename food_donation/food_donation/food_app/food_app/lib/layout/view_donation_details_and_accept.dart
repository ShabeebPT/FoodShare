import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/layout/bot_recipient.dart';
import 'package:food_app/layout/draw_recipient.dart';
import 'package:food_app/layout/login.dart';
import 'package:http/http.dart';
import 'dart:convert';
class view_donation extends StatefulWidget {
  // const v_avail({super.key});
  const view_donation({Key? key}) : super(key: key);

  @override
  State<view_donation> createState() => _view_donationState();
}

class _view_donationState extends State<view_donation> {

  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"donation_details/view_details/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    this.setState(() {
    });
    print(resp1.body);
  }
  void apprv(orid) async {
    var url = Uri.parse(login.url+"/donation_details/approve/");
    Response resp1 = await post(url,body: {
      "orid":orid,
      'uid':login.uid
    });
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
      drawer: draw_recipient(),
      bottomNavigationBar: botnav_recipient(),
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
                              Container(
                                padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                                child: ElevatedButton
                                  (onPressed: (){
                                  apprv(data[index]['donation_id'].toString());
                                },
                                  style:ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                  ),
                                  child: Text("Approve"),
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

