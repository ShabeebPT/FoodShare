import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:food_app/layout/login.dart';
import 'package:food_app/layout/main_recipient.dart';
import 'package:http/http.dart';

class post_complaint extends StatefulWidget {
  const post_complaint({Key? key}) : super(key: key);

  @override
  State<post_complaint> createState() => _post_complaintState();
}

class _post_complaintState extends State<post_complaint> {
  late TextEditingController complaint;
  @override
  void initState(){
    complaint=TextEditingController();
    super.initState();
  }
  void postdata()async{
    String url=login.url+"complaint/post_complaint/";
    if (complaint.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Complaint")));
    }
    else{

      var resp=await post(url,body: {
        "complaint_details":complaint.text.toString(),
        'rid':login.uid
      });
    }
  }
  @override


  Widget build(BuildContext context) {

    return Scaffold(
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
                child: Text("COMPLAINT",
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
                    controller: complaint,
                    decoration: InputDecoration(
                      // labelText: 'Name',
                      hintText: "Complaint",
                      prefixIcon: Icon(Icons.people),
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => mainpage_recipient()));
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
                    child: Text("Post",
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