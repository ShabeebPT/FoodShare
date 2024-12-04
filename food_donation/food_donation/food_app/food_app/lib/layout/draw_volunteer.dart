import 'package:flutter/material.dart';
import 'package:food_app/layout/login.dart';


class draw_volunteer extends StatefulWidget {
  const draw_volunteer({Key? key}) : super(key: key);

  @override
  State<draw_volunteer> createState() => _draw_volunteerState();
}
class _draw_volunteerState extends State<draw_volunteer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/v.jpeg'),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        'Welcome Volunteer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )

                ],
                alignment: AlignmentDirectional.center,
              ),
              decoration: BoxDecoration(
                  color: Colors.teal
              ),
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Gps Donor'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/volunteer_vw_donor');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Gps Recipient'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/rec_location');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('View Donation Details'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/volu_vw_donation');
              },
            ),
            ListTile(
              leading: Icon(Icons.login_outlined),
              title: Text('Logout'),
              onTap: (){
                // Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
