import 'package:flutter/material.dart';
import 'package:food_app/layout/bot_recipient.dart';
import 'package:food_app/layout/bot_volunteer.dart';
import 'package:food_app/layout/draw_recipient.dart';
import 'package:food_app/layout/draw_volunteer.dart';



class mainpage_volunteer extends StatefulWidget {
  const mainpage_volunteer({Key? key}) : super(key: key);

  @override
  State<mainpage_volunteer> createState() => _mainpage_volunteerState();
}

class _mainpage_volunteerState extends State<mainpage_volunteer> {
  // static const data = [
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/VK/FQ/EG/17769549/ap0015.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/RL/ZT/GR/17769549/bkt001-5347-1000x1000.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/TE/IH/KW/17769549/bkt00125-1000x1000.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/OZ/MM/UW/17769549/bkt0041--1000x1000.jpg"
  // ];
  var label=['Home','Page1','Page2','Page3','Page4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // automaticallyImplyLeading: false,
        title: const Text('FoodShare'),
      ),
      drawer: draw_volunteer(),
      bottomNavigationBar: botnav_volunteer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/page4.jpg'),
              fit: BoxFit.cover,
            )
        ),

      ),
    );
  }
}
