

import 'package:flutter/material.dart';
import 'package:mausam/activity/home.dart';
import 'package:mausam/activity/loading.dart';
import 'package:mausam/activity/location.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/":(context)=>Loading(),
      "/home":(context)=>Home(),
      "/loading":(context)=>Loading()
      
    },
  ));
}

