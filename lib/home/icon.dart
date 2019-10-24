import 'package:flutter/material.dart';
class icons extends StatefulWidget {
  @override
  _iconsState createState() => _iconsState();
}

class _iconsState extends State<icons> with SingleTickerProviderStateMixin{
  @override
  AnimationController _animationController;
  bool isPlaying=false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(vsync: this,duration:Duration(milliseconds: 300));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  AnimatedIcon(color: Colors.pink,size: 35,icon: AnimatedIcons.add_event,progress: _animationController,),
    );
  }

  _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
  }


