import 'package:flutter/material.dart';
class botnav_volunteer extends StatefulWidget {
  const botnav_volunteer({Key? key}) : super(key: key);

  @override
  State<botnav_volunteer> createState() => _botnav_volunteerState();
}

class _botnav_volunteerState extends State<botnav_volunteer> {
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
            Navigator.pushNamed(context, '/main_volunteer');
          }
          else if(_currentIndex==1)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/rec_location');
          }
          else if(_currentIndex==2)
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/volunteer_vw_donor');
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
          label: 'Gps Recipient',

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
