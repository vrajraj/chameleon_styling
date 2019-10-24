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
    Timer(Duration(seconds:6), () =>  Navigator.pushReplacement(context,
    new MaterialPageRoute(builder: (context) => new Home()),
     )
     );
  }
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 500,
            width: 500,
            child: Image(image: AssetImage('assets/chameleonFire.gif'),fit: BoxFit.fill,),
//          decoration: BoxDecoration(image: DecorationImage(
//            image: AssetImage('assets/chameleonFire.gif'),
//            fit: BoxFit.contain,
//          )),
          ),
        )
    );
  }
}
