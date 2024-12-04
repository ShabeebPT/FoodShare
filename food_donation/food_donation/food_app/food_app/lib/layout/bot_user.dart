import 'package:flutter/material.dart';
class botnav_donor extends StatefulWidget {
  const botnav_donor({Key? key}) : super(key: key);

  @override
  State<botnav_donor> createState() => _botnav_donorState();
}

class _botnav_donorState extends State<botnav_donor> {
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
            Navigator.pushNamed(context, '/main_donor');
          }
          else if(_currentIndex==1)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/add_donation_details');
          }
          else if(_currentIndex==2)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/track');
          }
          else if(_currentIndex==3)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/view_status');
          }
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
          label: 'Add Donation Details',

          icon: Icon(Icons.note),
        ),
        BottomNavigationBarItem(
          label: 'Tracking',
          icon: Icon(Icons.note_alt),
        ),

        BottomNavigationBarItem(
          label: 'View Status',
          icon: Icon(Icons.note),
        ),
      ],
    );;
  }
}
