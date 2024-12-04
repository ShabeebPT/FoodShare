import 'package:flutter/material.dart';
import 'package:food_app/layout/login.dart';


class draw_recipient extends StatefulWidget {
  const draw_recipient({Key? key}) : super(key: key);

  @override
  State<draw_recipient> createState() => _draw_recipientState();
}
class _draw_recipientState extends State<draw_recipient> {
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
                      backgroundImage: AssetImage('assets/u.jpeg'),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        'Welcome Recipient',
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
              title: Text('View Donation details'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_donation_details');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Gps Donor'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/don_location');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Post Complaint'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/post_complaint');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('View Reply'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_rpy');
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
