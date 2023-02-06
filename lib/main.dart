import 'package:flutter/material.dart';
import 'package:moviesnew/homelayout.dart';
import 'package:moviesnew/TESTscreen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: homelayout.routname,
      routes: {
      homelayout.routname:(context)=>homelayout(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
