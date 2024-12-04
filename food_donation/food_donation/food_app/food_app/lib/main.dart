import 'package:flutter/material.dart';
import 'package:food_app/layout/abc.dart';
import 'package:food_app/layout/add_donation_details.dart';
import 'package:food_app/layout/donation_tracking.dart';
import 'package:food_app/layout/donor_location.dart';
import 'package:food_app/layout/donors_reg.dart';
import 'package:food_app/layout/ip.dart';
import 'package:food_app/layout/login.dart';
import 'package:food_app/layout/main_donor.dart';
import 'package:food_app/layout/main_recipient.dart';
import 'package:food_app/layout/main_volunteer.dart';
import 'package:food_app/layout/post_complaint.dart';
import 'package:food_app/layout/recipient_location.dart';
import 'package:food_app/layout/recipients_reg.dart';
import 'package:food_app/layout/view_don_volunteer.dart';
import 'package:food_app/layout/view_donation_details_and_accept.dart';
import 'package:food_app/layout/view_donation_status_donor.dart';
import 'package:food_app/layout/view_reply.dart';
import 'package:food_app/layout/vol_view_donor_location.dart';

void  main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => ip(),
      '/add_donation_details':(context) => donation_details(),
      '/donors_reg':(context) => donors_reg(),
      '/reipient_reg':(context) => recipient_reg(),
      '/main_donor':(context) => main_donor(),
      '/main_volunteer':(context) => mainpage_volunteer(),
      '/main_recipient':(context) => mainpage_recipient(),
      '/view_donation_details':(context) => view_donation(),
      '/view_status':(context) => view_donation_status(),
      '/track':(context) => view_map(),
      '/rec_location':(context) => recipient_location(),
      '/don_location':(context) => donors_location(),
      '/volunteer_vw_donor':(context) => vol_vw_donor_location(),
      '/volu_vw_donation':(context) => view_donation_volunteer(),
      '/abc':(context) => aaaaaa(),
      '/post_complaint':(context) => post_complaint(),
      '/view_rpy':(context) => view_reply()


    },
  ));

}