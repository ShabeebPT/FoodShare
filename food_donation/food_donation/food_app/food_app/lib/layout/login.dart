import 'dart:convert';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/layout/main_donor.dart';
import 'package:food_app/layout/main_recipient.dart';
import 'package:food_app/layout/main_volunteer.dart';
import 'package:food_app/layout/option.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';

class login extends StatefulWidget {

  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
  static var uid="";
  static var url="http://192.168.43.24:8000/";
  static var lat='';
  static var lon='';
}

class _loginState extends State<login> {
  // Location _location = Location();
  // late LocationData _currentLocation;

  Future<void> _getLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      print('hello');
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var lat=position.latitude.toString();
      var lon =position.longitude.toString();

      setState(() {
        login.lat=position.latitude.toString();
        login.lon=position.longitude.toString();

      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }


  late TextEditingController username,password;
  var data=[];
  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    _getLocation();
    //TODO: implement initstate
    super.initState();
  }

  void postdata() async {

    var url1=Uri.parse(login.url+"login/login_flutter/");
    //String url ="";
    Response resp = await post(url1,body:{
      "username":username.text.toString(),
      "password":password.text.toString(),
      "lat":login.lat,
      'lon':login.lon,
    });
    data=jsonDecode(resp.body);
    if(data.length>0)
    {
      login.uid=data[0]['u_id'].toString();

      print("hello");
      print(login.uid);
      if(data[0]['type']=="user")
      {
        //navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder:(BuildContext context) => mainpage_recipient())); //MaterialPageRoute
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("you have successfully logged in")));
      }
      else if(data[0]['type']=="donor")
      {
        Navigator.of(context).push(MaterialPageRoute(
            builder:(BuildContext)=> main_donor()));
        showDialog(context: context,builder: (context)=>AlertDialog(
            content: Text("you have successfully logged in")));
      }
      else if(data[0]['type']=="volunteer")
      {
        Navigator.of(context).push(MaterialPageRoute(
            builder:(BuildContext)=> mainpage_volunteer()));
        showDialog(context: context,builder: (context)=>AlertDialog(
            content: Text("you have successfully logged in")));
      }
    }
  }
  var _isVisible=false;
  //  bool passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    final deviceHeight=MediaQuery.of(context).size.height;
    final deviceWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Color.fromRGBO(55, 33, 167, 1),
      //   title: Text("SCRAPIT",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
      // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                    height: deviceHeight*0.30,
                    child: FittedBox(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                        backgroundColor: Colors.white10,
                        radius: 120,
                      ),
                    ),
                  ),
                  Container(
                    height: deviceHeight*0.65,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: LayoutBuilder(builder: ((ctx, constraints) {
                      return Column(
                        children: [
                          // Text('EASY PAY',
                          //   style: TextStyle(
                          //       fontSize: 36, fontWeight: FontWeight.bold,
                          //       color: Color.fromARGB(255, 118, 13, 13)
                          //   ),
                          // ),
                          SizedBox(height: constraints.maxHeight*0.01,
                          ),
                          // Text('Username'),
                          // SizedBox(
                          //   height: constraints.maxHeight*0.08,
                          // ),
                          Container(
                            height: constraints.maxHeight*0.12,
                            decoration: BoxDecoration(color: Color(0xffb4b4b4).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Center(
                                  child: TextField(
                                    controller: username,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Username',
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight*0.02,
                          ),
                          Container(
                            height: constraints.maxHeight*0.12,
                            decoration: BoxDecoration(
                              color: Color(0xffb4b4b4).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Center(
                                  child:TextField(
                                    controller: password,
                                    obscureText: _isVisible? false:true,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            _isVisible=!_isVisible;
                                          });
                                        },
                                        icon: Icon(
                                          _isVisible?Icons.visibility:
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                    ),
                                  )
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: (){}, child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  // color: Color(0xffF80849),
                                ),
                              ))
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: constraints.maxHeight*0.12,
                            margin: EdgeInsets.only(top: constraints.maxHeight*0.05,
                            ),
                            child: ElevatedButton(onPressed: (){
                              postdata();
                            },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                // primary: Color(0xffF80849),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight*0.02,
                          ),
                          RichText(text: TextSpan(
                              text: 'Do not have an account..',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              children: [
                                TextSpan(
                                    text: 'Register',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 151, 21, 21),
                                      fontSize: 18,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap=(){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>option()));
                                    }
                                )
                              ]
                          ))

                        ],
                      );
                    }),),
                  )
                ]),
          )
          ,)

    );

  }
}