import 'package:flutter/material.dart';
class botnav_recipient extends StatefulWidget {
  const botnav_recipient({Key? key}) : super(key: key);

  @override
  State<botnav_recipient> createState() => _botnav_recipientState();
}

class _botnav_recipientState extends State<botnav_recipient> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
          print(_currentIndex);
          if(_currentIndex==0)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/main_recipient');
          }
          else if(_currentIndex==1)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/view_donation_details');
          }
          else if(_currentIndex==2)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/don_location');
          }
          // else if(_currentIndex==3)
          // {
          //   Navigator.pop(context);
          //   Navigator.pushNamed(context, '/view_user');
          // }
          // else if(_currentIndex==4)
          // {
          //   Navigator.pop(context);
          //   Navigator.pushNamed(context, '/add_disease');
          // }
        });

      },
      items: [
        BottomNavigationBarItem(
          label: '',

          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'View Donation Details',

          icon: Icon(Icons.note),
        ),
        BottomNavigationBarItem(
          label: 'Gps Donor',
          icon: Icon(Icons.note_alt),
        ),

        // BottomNavigationBarItem(
        //   label: 'Disease',
        //   icon: Icon(Icons.note),
        // ),
      ],
    );;
  }
}
