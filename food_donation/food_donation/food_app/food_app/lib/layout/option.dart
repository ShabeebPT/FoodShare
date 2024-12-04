
import 'package:flutter/material.dart';
import 'package:food_app/layout/donors_reg.dart';
import 'package:food_app/layout/recipients_reg.dart';
import 'package:http/http.dart';
class option extends StatefulWidget {
  const option({Key? key}) : super(key: key);

  @override
  State<option> createState() => _optionState();
}

class _optionState extends State<option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: Text(
      //     "CMS Group",
      //     style: new TextStyle(
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 220, 214, 232),
              Color.fromARGB(255, 218, 214, 229),
              // Colors.grey
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   // alignment: ,
                //   child: CircleAvatar(
                //     backgroundColor: Colors.white,
                //     radius: 40.0,
                //     backgroundImage: AssetImage('assets/b2.jpg'),
                //     // backgroundImage: ,
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
                  child: Text("Choose Your Category",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
                Container(
                  // decoration: new BoxDecoration(
                  //   borderRadius: new BorderRadius.circular(20),
                  //   color: Colors.deepPurple,
                  // ),
                  child: Column(
                    children: [
                      // Container(
                      //   width: 200,
                      //   height: 75,
                      //   // color: Colors.cyan,
                      //   padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      //   child: ElevatedButton
                      //     (onPressed: () {
                      //     // postdata();
                      //     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => farmer()));
                      //   },
                      //     style: ElevatedButton.styleFrom(
                      //       primary: Colors.deepPurple, // Background color
                      //     ),
                      //     child: Text("Farmer"),
                      //   ),
                      // ),
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => donors_reg()));
                          },
                          child: Text("DONOR",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ),
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => recipient_reg()));
                          },
                          child: Text("USER",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        ),
                      ),


                    ],
                  ),
                )

              ],

            ),
          ),
        ),
      ),



    );
  }
}