import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:food_app/layout/login.dart';
import 'package:http/http.dart';

class donors_reg extends StatefulWidget {
  const donors_reg({Key? key}) : super(key: key);

  @override
  State<donors_reg> createState() => _donors_regState();
}

class _donors_regState extends State<donors_reg> {
  late TextEditingController Name,Address,Phone_Number,password;

  bool validatephone(String value){
    var ph=value;
    bool phone=RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(ph);
    return phone;

  }

  @override
  void initState(){
    Name=TextEditingController();
    Address=TextEditingController();
    Phone_Number=TextEditingController();
    password=TextEditingController();
    // Gender=TextEditingController();
    super.initState();
  }
  void postdata()async{
    String url=login.url+"donor_reg/post_registration/";
    if (Name.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Required Name")));
    }
    else if(Address.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required address")));
    }
    else if(!validatephone(Phone_Number.text))
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required valid phone number")));
    }
    else if(password.text=='')
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Required password")));
    }
    else{

      var resp=await post(url,body: {
        "user_name":Name.text.toString(),
        "address":Address.text.toString(),
        "ph_no":Phone_Number.text.toString(),
        "password":password.text.toString()

      });
      print(resp.body);
      if(resp.body=="User exist")
      {
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("User exist")));
      }
      else{

        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => login()));
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("Registered successfully")));
      }

    }
  }
  bool passwordVisible=false;
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
                child: Text("REGISTRATION",
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
                    controller: Name,
                    decoration: InputDecoration(
                      // labelText: 'Name',
                      hintText: "Name",
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
                    controller: Address,
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
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: Container(padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  decoration: BoxDecoration(
                      color: Color(0xffb4b4b4).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextFormField(
                    controller: Phone_Number,
                    decoration: InputDecoration(
                      // labelText: 'Phone number',
                      hintText: "Phone number",
                      prefixIcon: Icon(Icons.phone_android),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                  decoration: BoxDecoration(
                      color: Color(0xffb4b4b4).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: TextField(
                    controller: password,
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      // labelText: "Password",
                      // helperText:"Password must contain special character",
                      // helperStyle: TextStyle(color: Colors.green),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                                () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      alignLabelWithHint: false,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
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
                    child: Text("Register",
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