import 'package:flutter/material.dart';
import 'package:food_app/layout/login.dart';


class draw_donor extends StatefulWidget {
  const draw_donor({Key? key}) : super(key: key);

  @override
  State<draw_donor> createState() => _draw_donorState();
}
class _draw_donorState extends State<draw_donor> {
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
                      backgroundImage: AssetImage('assets/d.jpeg'),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        'Welcome Donor',
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
              title: Text('Add Donation details'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/add_donation_details');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('View Status'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/view_status');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Track Donation'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/track');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Gps Recipient'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/abc');
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
