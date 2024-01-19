// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'welcomeScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        // child: Center(
        //   child: Container(
        //     height: 260,
        //     width: 260,
        //     decoration: BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage('assets/asumaLogo.jpg'),
        //             fit: BoxFit.cover)),
        //   ),
        // ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/asuma.jpg'), fit: BoxFit.cover),
        ),
      ),
    ));
  }
}
