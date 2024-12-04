import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:food_app/layout/login.dart';
import 'package:food_app/layout/main_donor.dart';
import 'package:http/http.dart';

import 'bot_user.dart';
import 'draw_donor.dart';

class donation_details extends StatefulWidget {
  const donation_details({Key? key}) : super(key: key);

  @override
  State<donation_details> createState() => _donation_detailsState();
}

class _donation_detailsState extends State<donation_details> {
  late TextEditingController d_fetails,address;

  @override
  void initState(){
    d_fetails=TextEditingController();
    address=TextEditingController();
    super.initState();
  }
  void postdata()async{
    String url=login.url+"donation_details/post_donation/";
    if (d_fetails.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Details")));
    }
    else if(address.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required address")));
    }

    else{

      var resp=await post(url,body: {
        "donation_details":d_fetails.text.toString(),
        "address":address.text.toString(),
        'did':login.uid

      });
      print(resp.body);
      if(resp.body=="User exist")
      {
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("User exist")));
      }
      else{

        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => main_donor()));
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("Added successfully")));
      }

    }
  }
  bool passwordVisible=false;
  @override


  Widget build(BuildContext context) {

    return Scaffold(
      drawer: draw_donor(),
      bottomNavigationBar: botnav_donor(),
      appBar: AppBar(
        title: Text("Food Donation",
          style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20,top: 10),
                child: Text("DONATION DETAILS",
                  style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 9, 31, 69)
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 0,top: 10),

                child: Container(

                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(color: Color(0xffb4b4b4).withOpacity(0.4),
                    // border:Border.all(),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    controller: d_fetails,
                    decoration: InputDecoration(
                      // labelText: 'Name',
                      hintText: "Donation_details",
                      prefixIcon: Icon(Icons.people),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: Container(padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  decoration: BoxDecoration(
                      color: Color(0xffb4b4b4).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextFormField(
                    controller: address,
                    decoration: InputDecoration(
                      // labelText: 'Place',
                      hintText: "Address",
                      prefixIcon: Icon(Icons.place),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: ElevatedButton
                    (
                    onPressed: () {
                      postdata();
                      // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => login()));
                    },
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.blue, // Set the button's background color.
                      // onPrimary: Colors.white, // Set the button's text color.
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 125),
                      // Adjust button padding.
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            16), // Set the button's corner radius.
                      ),
                      elevation: 5,
                      // Set the button's elevation.
                      shadowColor: Colors
                          .blue[800], // Set the button's shadow color.
                    ),
                    child: Text("Add",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),

                  ),
                ),
              )
            ],),
          ),
        ),
      ),
    );

  }
}