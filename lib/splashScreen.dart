import 'package:flutter/material.dart';
import './home/home_page.dart';
import 'dart:async';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds:2), () =>  Navigator.pushReplacement(context,
    new MaterialPageRoute(builder: (context) => new Home()),
     )
     );
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/logo/Logo Chameleon.png'),
            fit: BoxFit.contain,
          )),
        )
    );
  }
}
